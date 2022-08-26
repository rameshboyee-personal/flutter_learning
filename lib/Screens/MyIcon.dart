import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icons Page"),
        centerTitle: true,
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("I am Stateless Widget .I don't change never."),
          Text("Below are some Icons"),
          Icon(Icons.abc),
          Icon(Icons.home),
          Icon(Icons.done),
          Icon(Icons.airplane_ticket),

        ],
      )),
    );
  }
}
