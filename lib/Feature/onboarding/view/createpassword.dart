import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:henri_ppp/Feature/onboarding/view/login.dart';
import 'package:henri_ppp/widgets/button.dart';
import 'package:henri_ppp/widgets/textfield.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff041d5a),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
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
            Text(
              "Create New Password",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: size.height * 0.02,
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
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const btnGlobal(
                width: 0.9,
                height: 0.05,
                text: "Save",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
