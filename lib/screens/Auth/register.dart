import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/Widgets/elevated_btn.dart';
import 'package:news/core/firebase/firebase_maneger.dart';
import 'package:news/core/routes/page_name_route.dart';

import '../../Widgets/login_btn.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var rePasswordController = TextEditingController();
  bool _isObscuredPassword = true;
  bool _isObscuredRePassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.asset("assets/images/splashLight.png",
                        width: 136.w, height: 186.h),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),

                  /// First Name Btn
                  LoginBtn(
                    show: false,
                    prefixIcon: const Icon(Icons.person_outline),
                    tittle: "Name",
                    textEditingController: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name Is Required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),

                  /// Email Btn
                  LoginBtn(
                    show: false,
                    prefixIcon: const Icon(Icons.email),
                    tittle: "Email",
                    textEditingController: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pleas Enter Your Email';
                      }
                      final emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please Enter A Valid Email Address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),

                  /// Password Btn
                  LoginBtn(
                    show: _isObscuredPassword,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscuredPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscuredPassword = !_isObscuredPassword;
                        });
                      },
                    ),
                    tittle: "Password",
                    textEditingController: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                      if (value.length < 6) {
                        return 'Password Should Be At Least 6 Characters Long'
                            ;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),

                  ///Re Password Btn
                  LoginBtn(
                    show: _isObscuredRePassword,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscuredRePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscuredRePassword = !_isObscuredRePassword;
                        });
                      },
                    ),
                    tittle: "RePassword",
                    textEditingController: rePasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                      if (value.length < 6) {
                        return 'Password Should Be At Least 6 Characters Long'
                            ;
                      }
                      if (passwordController.text != value) {
                        return 'Password And RePassword Should Match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedBtn(
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        FirebaseManager.createUser(
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                          () {
                            Navigator.pushNamed(
                              context,
                              PageRouteName.login,
                            );
                          },
                          (message) {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title:const Text(
                                  'Something Went Wrong',
                                ),
                                content: const Text(
                                  "The account already exists for tha email."
                                      ,
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child:const Text("ok"),
                                  ),
                                ],
                              ),
                            );
                          },
                          () {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                backgroundColor: Colors.transparent,
                                title: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                          },
                        );
                        nameController.clear();
                        emailController.clear();
                        passwordController.clear();
                        rePasswordController.clear();
                      }
                    },
                    lable: "Create Account",
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteName.login);
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Already Have Account",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const TextSpan(text: " "),
                            TextSpan(
                              text: "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Theme.of(context).primaryColorLight,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
