import 'package:flutter/material.dart';

class ContainerMarginPaddingPage extends StatelessWidget {
  const ContainerMarginPaddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Padding Margin Example"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.green,
        height: 200,
        width: 200,
        child: Text(
          "Boring!!",
          style: TextStyle(backgroundColor: Colors.white, fontSize: 30.0),
        ),
        // margin: EdgeInsets.only(left: 40,top: 40),
        // margin: EdgeInsets.symmetric(horizontal: 40)
        //   margin: EdgeInsets.fromLTRB(8,8,10,20)
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(55),
      ),
    );
  }
}
