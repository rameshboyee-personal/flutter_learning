import 'package:flutter/material.dart';
import 'package:hello_world/Screens/my_first_page.dart';
import 'package:hello_world/Screens/raised_button.dart';
import 'package:hello_world/Screens/row_widget.dart';

import 'Screens/column_widget.dart';
//Widgets App
//Material App

//material.io.design

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My APP First Page",
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light, /*fontFamily: "Ind"*/
      ),
      home:const ColoumnWidgetPage()
    );
  }
}
