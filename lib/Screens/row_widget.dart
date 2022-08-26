import 'package:flutter/material.dart';

class RowWidgetPage extends StatelessWidget {
  const RowWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: const Text("Row Widget Example"),
        centerTitle: true,
        backgroundColor: Colors.green,
        // leading: Icon(Icons.home),
      ),

      body:   Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(Icons.done,size: 40.0,),
            Icon(Icons.favorite,size: 40.0,),
            Icon(Icons.done_all,size: 40.0,),
            Icon(Icons.home,size: 40.0,),


          ],

          ),
      )

    );
  }
}
