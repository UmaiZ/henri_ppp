import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:henri_ppp/view/onboarding/login.dart';
import 'package:henri_ppp/widgets/button.dart';
import 'package:henri_ppp/widgets/textfield.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff041d5a),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: btnGlobal(
                width: 0.9,
                height: 0.05,
                text: "Continue",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
