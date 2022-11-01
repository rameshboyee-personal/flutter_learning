import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:hello_world/SharedPreferences/AuthKey.dart';
import 'package:hello_world/SignUp/signin_screen.dart';

import 'Api/api_ui.dart';
import 'Components/BluetoothChat/bluetooth_demo.dart';
import 'Components/BluetoothChat/bluetooth_serial.dart';
import 'Components/BluetoothChat/chart_page.dart';
import 'Components/MobileNumber/mobileNumber.dart';
import 'Components/Permissions/permission_ui.dart';
import 'Components/all_componets.dart';
import 'FireBase/fire_base_signup.dart';
import 'Screens/dynamic_list_view.dart';
import 'Screens/navigator_example.dart';
import 'SharedPreferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

//Widgets App
//Material App

//material.io.design

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool? isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My APP First Page",
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light /*fontFamily: "Ind"*/
            ),
        home:  AllComponents());
  }
}


