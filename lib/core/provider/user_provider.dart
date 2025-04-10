import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:news/core/firebase/firebase_maneger.dart';
import 'package:news/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  User? currentUser;

  UserProvider() {
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      intUser();
    }
  }

  intUser() async {
    currentUser = FirebaseAuth.instance.currentUser;
    userModel = await FirebaseManager.getUserData(currentUser!.uid);
    notifyListeners();
  }
}
