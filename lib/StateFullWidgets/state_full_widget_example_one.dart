import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateFullWidgetExampleOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateFullWidgetExampleOneState();
}

class _StateFullWidgetExampleOneState extends State<StatefulWidget> {
  bool liked = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Full Widget Example One"),
      ),
      body: GestureDetector(
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
              Text(
                "I am statefull widget.\n I have feelings",
                style: TextStyle(fontSize: 30, fontFamily: "Ind"),
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
      ),
    );
  }
}
