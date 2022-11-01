import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'BluetoothChat/bluetooth_demo.dart';
import 'BluetoothChat/bluetooth_serial.dart';
import 'BluetoothChat/chart_page.dart';
import 'MobileNumber/mobileNumber.dart';
import 'Permissions/permission_ui.dart';

class AllComponents extends StatefulWidget {
  const AllComponents({Key? key}) : super(key: key);

  @override
  State<AllComponents> createState() => _AllComponentsState();
}

class _AllComponentsState extends State<AllComponents> {
  String code = "";

  @override
  void initState() {
    getCountryName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("All Components"),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              trailing: Icon(Icons.mobile_friendly_sharp),
              title: Text("Getting Mobile Number from device"),
              onTap: () {
                goToGettingMobileNumbers(context);
              },
            ),
            ListTile(
                trailing: Icon(Icons.bluetooth),
                title: Text("Bluetooth"),
                onTap: () {
                  goToBluetoothDemo(context);
                }),
            ListTile(
                trailing: Icon(Icons.chat),
                title: Text("Chat Page"),
                onTap: () {
                  goToChatPage(context);
                }),
            ListTile(
                trailing: Icon(Icons.bluetooth_connected_rounded),
                title: Text("Bluetooth Serial"),
                onTap: () {
                  goToBluetoothSerial(context);
                }),
            ListTile(
                trailing: Icon(Icons.perm_identity),
                title: Text("Permissions"),
                onTap: () {
                  goToPermissionPage(context);
                }),
            ListTile(title: Text("Location: $code"))
          ],
        ),
      ),
    );
  }

  getCountryName() {
    try {
      http.get(Uri.parse('http://ip-api.com/json')).then((value) {
        print("Ramesh");
        setState(() {
          code = json.decode(value.body).toString();
        });
        print(json.decode(value.body));
      });
    } catch (err) {
      //handleError
    }
  }

  goToBluetoothDemo(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FlutterBlueApp()));
  }

  goToBluetoothSerial(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BluetoothApp()));
  }

  goToChatPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChatPage()));
  }

  goToGettingMobileNumbers(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MobileNumberExample()));
  }

  goToPermissionPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ImageScreen()));
  }
}
