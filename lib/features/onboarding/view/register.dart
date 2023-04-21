import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:henri_ppp/features/onboarding/view/login.dart';
import 'package:henri_ppp/widgets/button.dart';
import 'package:henri_ppp/widgets/textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff041d5a),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
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
                hinttext: "Name",
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
                hinttext: "Email",
                suffixicon: Icon(
                  Icons.email_outlined,
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
              const txtfieldGlobal(
                width: 0.9,
                hinttext: "Confirm Password",
                suffixicon: Icon(
                  Icons.password_outlined,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: btnGlobal(
                  width: 0.9,
                  height: 0.05,
                  text: "Signup",
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
                            "Already have an account?",
                            style: TextStyle(fontSize: 17),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              " Sign In",
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
    );
  }
}
