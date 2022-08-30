import 'package:flutter/material.dart';

class MySwitchPage extends StatefulWidget {
  const MySwitchPage({Key? key}) : super(key: key);

  @override
  State<MySwitchPage> createState() => _MySwitchPageState();
}

class _MySwitchPageState extends State<MySwitchPage> {
  bool _isSwitch= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Button"),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Switch(value: _isSwitch, onChanged: (val) {

              setState(() {
                _isSwitch = val;
              });

            }),
          ),

          Center(
            child: SwitchListTile(
                value: _isSwitch, title: Text("Health Card"),subtitle: Text("Health Card $_isSwitch"),
                onChanged: (val) {
              setState(() {
                _isSwitch = val;
              });

            }),

          )


        ],
      ),
    );
  }
}
