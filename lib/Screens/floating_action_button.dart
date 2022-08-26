import 'package:flutter/material.dart';
class FlotingActionButtonPage extends StatelessWidget {
  const FlotingActionButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Action Button Example"),
        centerTitle: true,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
        print("FAB clicked");
      },
        child: Icon(Icons.add,color: Colors.red,),
        hoverColor: Colors.green,
        // focusColor: Colors.yellow,
        tooltip: "Add to favorites ",
        
      ),
    );
  }
}
