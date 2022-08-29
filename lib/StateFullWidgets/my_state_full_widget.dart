import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStateFullWidget extends StatefulWidget {
  const MyStateFullWidget({Key? key}) : super(key: key);

  @override
  State<MyStateFullWidget> createState() => _MyStateFullWidgetState();
}

class _MyStateFullWidgetState extends State<MyStateFullWidget> {
  bool liked = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          liked = !liked;
          if(liked) {
            count++;
          }
        });
      },
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 220,
            ),
            liked? Text(
              "I am statefull widget.\n I have feelings",
              style: TextStyle(fontSize: 30, fontFamily: "Ind"),
            ): Text(
              "I am statefull widget.\n I have feelings",
              style: TextStyle(fontSize: 30),
            ),
            Icon(
              Icons.favorite,
              color: liked ? Colors.red : Colors.grey,
              size: 40.0,
            ),
            Text(
              "$count likes",
              style: TextStyle(fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
