
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertDialogeExample extends StatelessWidget {
  const AlertDialogeExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Alert Dialoge Example"),
        centerTitle: true,
      ),

      body: TextButton(
        onPressed: () {
          craeteAlertDialoge(context);
        },
        child: const Text('Show Alert Dialoge'),
      ),


    );
  }

  craeteAlertDialoge(BuildContext context) {
    var alertDialoge = AlertDialog(
       title: Text("Congrats!!"),
       content: Text("Congrats You have wone iPhone 7 plus!!"),
       backgroundColor: Colors.green,
       elevation: 10.0 ,
      actions: [
        TextButton(onPressed: () {
          Navigator.pop(context);
         },
          child: Icon(Icons.cancel),),

        TextButton(onPressed: () {
          Navigator.pop(context);
        },
          child: Icon(Icons.tiktok_outlined),),
        GestureDetector(
          child: Icon(Icons.home),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: Text("Ok"),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
         return alertDialoge;
    });
  }

}
