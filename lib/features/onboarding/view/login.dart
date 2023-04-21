import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:henri_ppp/features/onboarding/view/forgot.dart';
import 'package:henri_ppp/features/onboarding/view/register.dart';
import 'package:henri_ppp/features/root/view/mainroot.dart';

import 'package:henri_ppp/widgets/button.dart';
import 'package:henri_ppp/widgets/textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff041d5a),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
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
                const txtfieldGlobal(
                  width: 0.9,
                  hinttext: "Login",
                  suffixicon: Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                const txtfieldGlobal(
                  width: 0.9,
                  hinttext: "Password",
                  suffixicon: Icon(
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
                            builder: (context) => ForgotPage()));
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
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MainRoot()));
                  },
                  child: btnGlobal(
                    width: 0.9,
                    height: 0.05,
                    text: "Login",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.045,
                ),
                Text(
                  "Login With",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  width: size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: size.width * 0.125,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/facebook.png'),
                          )),
                      Container(
                          width: size.width * 0.125,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/google.png'),
                          )),
                      Container(
                          width: size.width * 0.125,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/apple.png'),
                          ))
                    ],
                  ),
                ),
                Spacer(),
                Container(
                    width: size.width * 0.925,
                    child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(fontSize: 17),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                              },
                              child: Text(
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
    );
  }
}
