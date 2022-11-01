import 'package:flutter/material.dart';
import 'package:hello_world/SignUp/sign_up_screen.dart';
import 'package:hello_world/Utils/colors.dart';

import '../reusableWidgets/reusable_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/sayukth_logo.png"),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter user name", Icons.person_outline,
                    false, userNameController,false),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter password", Icons.lock_outline,
                    true, passwordController,false),
                SizedBox(
                  height: 20,
                ),

                signInSignUpButton(context, true, () {

                }),

                SizedBox(
                  height: 10,
                ),

                signUpButton(),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
            "Don't have account? ",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),

          ),
        )
      ],
    );
  }
}
