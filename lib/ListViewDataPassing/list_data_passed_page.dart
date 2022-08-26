import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewDataPassedPage extends StatelessWidget {
  String country;
  ListViewDataPassedPage(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To $country"),
      ),
      body: Center(child: Text("I Love  $country"))
    );
  }
}
