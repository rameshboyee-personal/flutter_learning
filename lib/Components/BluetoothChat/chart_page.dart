import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:hello_world/BootomNavigationBar/my_bootom_navigation_bar.dart';
import 'package:hello_world/Components/BluetoothChat/client_page.dart';
import 'package:share_plus/share_plus.dart';
import '../../TabBar/tab_bar_page.dart';
import 'discovey_page.dart';


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  static const redColor = Color(0xFFC02C1A);
  static const blueColor = Color(0xFF48618a);
  String bluetoothName = "Hello";
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(14),
            child: CircleAvatar(
                backgroundColor: redColor,
                child: Text(
                  "R",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text("SaYukth Meet",
            style: TextStyle(color: Colors.black, fontSize: 24)),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        // or use Brightness.dark
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 2, bottom: 2),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: blueColor,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            getBluetoothId();
                            showModalBottomSheet<void>(
                              // context and builder are
                              // required properties in this widget
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                // we set up a container inside which
                                // we create center column and display text

                                // Returning SizedBox instead of a Container
                                return SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: ListView(
                                      children: <Widget>[
                                        ListTile(
                                          title: Text("Share"),
                                          trailing: Icon(Icons.share),
                                          subtitle: Text(
                                              "Share this Bluetooth Device Id to Your friends."),
                                          onTap: () {
                                            print("OnTap Clicked");
                                            Share.share(bluetoothName,
                                                subject: 'Bluetooth Device Id');
                                          },
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("Bluetooth Device ID"),
                                            Text("$bluetoothName")
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                "New Meeting",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          goToClientPagePage(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 2, bottom: 2),
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white10,
                            border: Border.all(
                              color: Colors.black87,
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Join a Meeting",
                                style: TextStyle(
                                    color: blueColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        // backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 90,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10, left: 10),
                  color: Colors.white10,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "SaYukth Meet",
                    style: TextStyle(color: Colors.blue, fontSize: 24),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings_outlined,
                color: Colors.black87,
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined, color: Colors.black87),
              title: Text("Send feedback",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TabBarPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.black87),
              title:
                  Text("Help", style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyBottomNavigationBar()));
              },
            ),
          ],
        ),
      ),
    );
  }

  getBluetoothId() async {
    setState(() async {
      String? name = await _bluetooth.name;
      bluetoothName = name!;
    });

  }

  goToClientPagePage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ClientPage()));
  }
}
