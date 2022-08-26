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
              RaisedButton(
                onPressed: () {},
                color: Colors.red,
                splashColor: Colors.black,
                child: Text("Button 1"),
               shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.blue,
                splashColor: Colors.yellow,
                child: Text("Button 2"),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),

              ),

              RaisedButton(
                onPressed: () {},
                color: Colors.cyan,
                splashColor: Colors.indigo,
                child: Text("Button 3"),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),

              ),


            ],
          ),
        ));
  }
}
