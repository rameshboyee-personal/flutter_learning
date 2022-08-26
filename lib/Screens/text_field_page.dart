import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  TextFieldPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Text Field Example"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: TextField(
                  controller: emailController,
                  keyboardType:TextInputType.emailAddress ,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    suffixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(

                    )
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.all(16),
                child: TextField(
                  controller: phoneNumberController,
                  keyboardType:TextInputType.phone ,
                  decoration: InputDecoration(
                      hintText: "Enter Phone Number",
                      suffixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: RaisedButton(onPressed: () {
                  print(emailController.text);
                  print(phoneNumberController.text);

                } ,child: Text("Get Data"), ),
              )
            ],
          ),
        )
    );
  }
}
