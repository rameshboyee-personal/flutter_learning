
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessageExample extends StatelessWidget {
  const ToastMessageExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Toast Message Example"),
        centerTitle: true,
      ),

      body: RaisedButton(
        onPressed: () {
           Fluttertoast.showToast(
               msg: "Hello this is toast message",
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.CENTER_RIGHT

           );
        },
        child: const Text('Toast Message'),
      ),


    );
  }
}
