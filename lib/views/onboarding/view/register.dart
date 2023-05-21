import 'package:flutter/material.dart';
import 'package:henri_ppp/controller/user_controller.dart';
import 'package:henri_ppp/views/onboarding/view/login.dart';
import 'package:henri_ppp/widgets/button.dart';
import 'package:henri_ppp/widgets/textfield.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final usercontroller = Provider.of<userController>(context, listen: false);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff041d5a),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height * 1.1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
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
                  width: size.width * 0.6,
                )),
                SizedBox(
                  height: size.height * 0.065,
                ),
                txtfieldGlobal(
                  textController: nameController,
                  width: 0.9,
                  hinttext: "Name",
                  validator: (value) {
                    if (value.length < 5) {
                      return 'Required Field';
                    }
                  },
                  suffixicon: const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                txtfieldGlobal(
                  textController: emailController,
                  width: 0.9,
                  hinttext: "Email",
                  validator: (value) {
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)) {
                      return 'Required field';
                    }
                  },
                  suffixicon: const Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                txtfieldGlobal(
                  width: 0.9,
                  textController: passwordController,
                  hinttext: "Password",
                  validator: (value) {
                    if (value.length < 5) {
                      return 'Must be more than 5 charater';
                    }
                  },
                  suffixicon: const Icon(
                    Icons.password_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                txtfieldGlobal(
                  width: 0.9,
                  textController: confirmpasswordController,
                  hinttext: "Confirm Password",
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Password not matched';
                    }
                    return null;
                  },
                  suffixicon: const Icon(
                    Icons.password_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      if (await usercontroller.RegisterHit({
                        "userEmail": emailController.text.trim().toLowerCase(),
                        "userName": nameController.text.trim().toLowerCase(),
                        "userPassword": passwordController.text.trim(),
                      })) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                      }
                    }

                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const LoginPage()));
                  },
                  child: const btnGlobal(
                    width: 0.9,
                    height: 0.05,
                    text: "Signup",
                  ),
                ),
                // const Spacer(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                    width: size.width * 0.925,
                    child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(fontSize: 17),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
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
      ),
    );
  }
}
