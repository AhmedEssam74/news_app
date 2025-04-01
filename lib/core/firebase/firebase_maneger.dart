import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/models/user_model.dart';

class FirebaseManager {
  /// Collection of Users
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  ///Create User Function
  static Future<void> addUser(UserModel model) {
    var createUserCollection = getUsersCollection();
    var docRef = createUserCollection.doc(model.id);
    return docRef.set(model);
  }
  /// Get User Function
  static Future<UserModel?> getUserData(String id) async {
    var getUserCollection = getUsersCollection();
    DocumentSnapshot<UserModel> snapShot =
    await getUserCollection.doc(id).get();
    return snapShot.data();
  }

  /// Authenticates
  /// Register
  static Future<void> createUser(String email, String password, String name,
      Function onSuccess, Function onError, Function onLoading) async {
    try {
      onLoading();
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel model = UserModel(
        name: name,
        email: email,
        id: credential.user!.uid,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      await addUser(model);
      // verified = credential.user!.emailVerified;
      credential.user!.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
      } else if (e.code == 'Email already in use') {
        onError(e.message);
      }
    } catch (error) {
      onError("Something went wrong");
      // print(error);
    }
  }

  /// Login
  static Future<void> loginUser(String email, String password,
      Function onSuccess, Function onError, Function onLoading) async {
    try {
      onLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified) {
        onSuccess();
      } else {
        onError(
            "email is not verified please check your mail and try again");
      }
    } on FirebaseAuthException catch (_) {
      onError("email or password is not valid");
    }
  }

  ///SignOut

  static Future<void> signOutUser() async {
    return await FirebaseAuth.instance.signOut();
  }
}