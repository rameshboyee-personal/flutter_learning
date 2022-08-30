import 'package:flutter/material.dart';

class ColoumnWidgetPage extends StatelessWidget {
  const ColoumnWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          title: const Text("Column Widget Example"),
          centerTitle: true,
          backgroundColor: Colors.green,
          // leading: Icon(Icons.home),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextButton(
                onPressed: () {}, child: Text("Button 1"),
                style: ButtonStyle(
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Button 2"),

              ),

              TextButton(
                onPressed: () {},
                child: Text("Button 3"),


              ),


            ],
          ),
        ));
  }
}
