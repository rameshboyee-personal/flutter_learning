import 'package:flutter/material.dart';
import 'package:hello_world/Screens/container_margin_padding.dart';
import 'package:hello_world/Screens/my_first_page.dart';
import 'package:hello_world/Screens/raised_button.dart';
import 'package:hello_world/Screens/row_widget.dart';
import 'package:hello_world/Screens/text_field_page.dart';

import 'Screens/column_widget.dart';
import 'Screens/floating_action_button.dart';
import 'Screens/snack_bar.dart';
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
      color: Colors.blue,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light, /*fontFamily: "Ind"*/
      ),
      home: SnackBarPage()
    );
  }
}
