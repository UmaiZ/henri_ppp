import 'package:flutter/material.dart';
import 'package:henri_ppp/Feature/profile/controller/user_controller.dart';
import 'package:henri_ppp/helpers/loader/loader.dart';
import 'package:henri_ppp/Feature/onboarding/view/forgot.dart';
import 'package:henri_ppp/Feature/onboarding/view/register.dart';
import 'package:henri_ppp/Feature/root/view/mainroot.dart';

import 'package:henri_ppp/widgets/button.dart';
import 'package:henri_ppp/widgets/textfield.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final usercontroller = Provider.of<userController>(context, listen: false);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff041d5a),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  SizedBox(
                      child: Image.asset(
                    'assets/images/logo.png',
                    width: size.width * 0.7,
                  )),
                  SizedBox(
                    height: size.height * 0.065,
                  ),
                  txtfieldGlobal(
                    width: 0.9,
                    validator: (value) {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                        return 'Required field';
                      }
                    },
                    textController: emailController,
                    hinttext: "Login",
                    suffixicon: const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  txtfieldGlobal(
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 5) {
                        return 'Required field';
                      }
                    },
                    width: 0.9,
                    hinttext: "Password",
                    textController: passwordController,
                    suffixicon: const Icon(
                      Icons.password_outlined,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ForgotPage()));
                        },
                        child: Text(
                          "Forgot password?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        showLoader(context);

                        if (await usercontroller.LoginHit({
                          "userEmail":
                              emailController.text.trim().toLowerCase(),
                          "userPassword": passwordController.text.trim(),
                        })) {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MainRoot()));
                        } else {
                          Navigator.pop(context);
                        }
                      }
                    },
                    child: const btnGlobal(
                      width: 0.9,
                      height: 0.05,
                      text: "Login",
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.045,
                  ),
                  // Text(
                  //   "Login With",
                  //   style: Theme.of(context).textTheme.headlineMedium,
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.03,
                  // ),
                  // SizedBox(
                  //   width: size.width * 0.9,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       Container(
                  //           width: size.width * 0.125,
                  //           decoration: const BoxDecoration(
                  //             color: Colors.white,
                  //           ),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Image.asset('assets/images/facebook.png'),
                  //           )),
                  //       Container(
                  //           width: size.width * 0.125,
                  //           decoration: const BoxDecoration(
                  //             color: Colors.white,
                  //           ),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Image.asset('assets/images/google.png'),
                  //           )),
                  //       Container(
                  //           width: size.width * 0.125,
                  //           decoration: const BoxDecoration(
                  //             color: Colors.white,
                  //           ),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Image.asset('assets/images/apple.png'),
                  //           ))
                  //     ],
                  //   ),
                  // ),

                  const Spacer(),
                  SizedBox(
                      width: size.width * 0.925,
                      child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(fontSize: 17),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()));
                                },
                                child: const Text(
                                  " Sign Up",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ))),
                  SizedBox(
                    height: size.height * 0.05,
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
