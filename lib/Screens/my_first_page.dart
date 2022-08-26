import 'package:flutter/material.dart';

import 'my_page.dart';

class MyFirstPage extends StatelessWidget {
  const MyFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: const Text("First Page"),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: Icon(Icons.home),
      ),

      // body:  Center(
      //   child: Text(
      //     "I am in the First Page",
      //     style: TextStyle(
      //       fontSize: 40,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.red[600],
      //       fontFamily:"Ind"
      //     ),
      //   ),
      // ),

      // body: const Center(child: Icon(Icons.done_all,color: Colors.green,size:20.0 ,semanticLabel: "LOVE",),),

      body: const Center(
        child: MyPage(),
      ),

      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
    );

  }
}
