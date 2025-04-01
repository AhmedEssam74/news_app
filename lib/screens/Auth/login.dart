import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/Widgets/elevated_btn.dart';
import 'package:news/Widgets/login_btn.dart';
import 'package:news/core/firebase/firebase_maneger.dart';
import 'package:news/core/provider/user_provider.dart';
import 'package:news/core/routes/page_name_route.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isObscured = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Login'),
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

                  /// Email Btn
                  LoginBtn(
                    show: false,
                    prefixIcon: const Icon(Icons.email),
                    tittle: "Email",
                    textEditingController: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Email';
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
                    height: 18.0,
                  ),

                  /// Password Btn
                  LoginBtn(
                    show: _isObscured,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
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
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, ForgetPassword.routeName);
                    },
                    child: Text(
                      textAlign: TextAlign.end,
                      "Forget Password",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).primaryColorLight,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  ElevatedBtn(
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        FirebaseManager.loginUser(
                          emailController.text,
                          passwordController.text,
                          () async {
                            // await userProvider.intUser();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              PageRouteName.homeScreen,
                              (_) => false,
                            );
                          },
                          (message) {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  'Something Went wrong',
                                  style:Theme.of(context).textTheme.titleMedium ,
                                ),
                                content: Text(
                                  message,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "OK",
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          () {
                            showDialog(
                              context: context,
                              builder: (_) =>  AlertDialog(
                                backgroundColor: Colors.transparent,
                                title: Center(
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).textTheme.titleMedium?.color,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    lable: "Login",
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteName.register);
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Don not have account",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const TextSpan(text: " "),
                            TextSpan(
                              text: "Create Account",
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
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 25,
                          endIndent: 15,
                          thickness: 2.0,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      Text(
                        "OR",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Expanded(
                        child: Divider(
                          indent: 15,
                          endIndent: 25,
                          thickness: 2.0,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Theme.of(context).cardColor,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(16.0),
                  //         side: BorderSide(
                  //           color: Theme.of(context).primaryColor,
                  //           width: 1.0,
                  //         ),
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, PageRouteName.register);
                  //     },
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(16.0),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Icon(
                  //             FontAwesomeIcons.google,
                  //             color: Theme.of(context).primaryColorLight,
                  //           ),
                  //           const SizedBox(width: 8.0),
                  //           Text(
                  //             "Log in with google",
                  //             style: Theme.of(context).textTheme.bodyMedium,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
