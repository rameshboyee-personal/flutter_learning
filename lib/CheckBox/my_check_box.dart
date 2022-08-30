import 'package:flutter/material.dart';

class MyCheckBoxPage extends StatefulWidget {
  const MyCheckBoxPage({Key? key}) : super(key: key);

  @override
  State<MyCheckBoxPage> createState() => _MyCheckBoxPageState();
}

class _MyCheckBoxPageState extends State<MyCheckBoxPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Box"),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: _isChecked,
              onChanged: (val) {
                setState(() {
                  _isChecked = val!;
                });
              }),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
              title: Text("Are you agrre this document?"),
              value: _isChecked,
              onChanged: (val) {
                setState(() {
                  _isChecked = val!;
                });
              })
        ],
      ),
    );
  }
}
