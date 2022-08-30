import 'package:flutter/material.dart';
import 'package:hello_world/DataPassingBetweenTwoScreens/userDetails.dart';

class userForm extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Form")),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    suffixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder()),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    suffixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder()),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: TextButton(
                onPressed: () {
                  goToUserDetailsPage(context);
                },
                child: const Text("Go to Details Page"),
              ),
            )
          ],
        ),
      ),
    );
  }
  goToUserDetailsPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> UserDetailsPage(emailController.text.toString(),phoneNumberController.text.toString()) )
    );

  }
}
