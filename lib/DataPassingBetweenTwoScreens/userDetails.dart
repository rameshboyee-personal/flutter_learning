
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {

  late String email,phoneNumber;
  UserDetailsPage(this.email,this.phoneNumber);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details Page"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("E-Mail"),
                Text("$email")
              ],
            ),
          ),

          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Phone Number"),
                Text("$phoneNumber")
              ],
            ),
          )

        ],
      ),
    );
  }
}
