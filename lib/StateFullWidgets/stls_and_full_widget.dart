import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/StateFullWidgets/my_state_full_widget.dart';
import 'package:hello_world/StateFullWidgets/my_state_less_widget.dart';
class StateLessAndFullWidget extends StatelessWidget {
  const StateLessAndFullWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text("State less VS State Full Widget")
      ),

      body: Column(
        children: <Widget>[
          SizedBox(height: 50),
          MyStateLessWidget(),
          SizedBox(height: 50),
          MyStateFullWidget()
        ],
      ),
      );
  }
}
