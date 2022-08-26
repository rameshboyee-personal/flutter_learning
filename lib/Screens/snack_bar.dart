import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  final scafoldKey = GlobalKey<ScaffoldState>();

  SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      appBar: AppBar(
        title: Text("Snack Bar Example"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var snackBar = SnackBar(
            content: Text("This is Snack Bar",style:TextStyle(color: Colors.yellow),),
            backgroundColor: Colors.green,
            action: SnackBarAction(label: 'Undo',onPressed: (){
              print("Undo Snack bar");
            },textColor: Colors.yellow,),

            );
          scafoldKey.currentState?.showSnackBar(snackBar);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        tooltip: "Snack Bar message purpose",
      ),
    );
  }
}
