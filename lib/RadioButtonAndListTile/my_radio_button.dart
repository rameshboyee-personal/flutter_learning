import 'package:flutter/material.dart';

class MyRadioButtonPage extends StatefulWidget {
  const MyRadioButtonPage({Key? key}) : super(key: key);

  @override
  State<MyRadioButtonPage> createState() => _MyRadioButtonPageState();
}

class _MyRadioButtonPageState extends State<MyRadioButtonPage> {
  int _checkedValue =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button"),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Radio(
              value: 0,
              groupValue: _checkedValue,
              onChanged: (val) {
                setState(() {
                  _checkedValue =0;
                  print("Selected Value $val");
                });
              }),
          Radio(
              value: 1,
              groupValue: _checkedValue,
              onChanged: (val) {
                setState(() {
                  _checkedValue =1;
                });
                print("Selected Value $val");
              }),
          Radio(
              value: 2,
              groupValue: _checkedValue,
              onChanged: (val) {
                setState(() {
                  _checkedValue =2;
                });
                print("Selected Value $val");
              }),

          RadioListTile(
              title: Text("Male"),
              value: 0,
              groupValue: _checkedValue,
              onChanged: (val) {
                setState(() {
                  _checkedValue =0;
                  print("Selected Value $val");
                });
              }),
          RadioListTile(
            title: Text("Female"),
              value: 1,
              groupValue: _checkedValue,
              onChanged: (val) {
                setState(() {
                  _checkedValue =1;
                });
                print("Selected Value $val");
              }),
          RadioListTile(
              title: Text("Other"),
              value: 2,
              groupValue: _checkedValue,
              onChanged: (val) {
                setState(() {
                  _checkedValue =2;
                });
                print("Selected Value $val");
              }),
        ],
      ),
    );
  }
}
