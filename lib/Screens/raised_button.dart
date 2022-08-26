import 'package:flutter/material.dart';

class RaisedButtonPage extends StatelessWidget {
  const RaisedButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: const Text("Raised Button Example"),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: Icon(Icons.home),
      ),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          print("Button Clicked");
        },
        onLongPress: () {
          print("Button Long Pressed");
        },
        color: Colors.red,
        textColor: Colors.black,
        child: Text(
          'Click Me!!',
          // style: TextStyle(color: Colors.white60),
        ),
      )),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
    );
  }
}
