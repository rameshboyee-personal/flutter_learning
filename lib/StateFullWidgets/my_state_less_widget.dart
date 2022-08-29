import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStateLessWidget extends StatelessWidget {
  const MyStateLessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "I am state less widget\n Sorry ,I dont have feelings",
          style: TextStyle(fontSize: 20),
        ),
        Icon(
          Icons.favorite,
          color: Colors.grey,
          size: 40.0,
        ),
        Text(
          "0 likes",
          style: TextStyle(fontSize: 22),
        )
      ],
    );
  }
}
