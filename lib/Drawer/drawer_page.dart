import 'package:flutter/material.dart';
import 'package:hello_world/BootomNavigationBar/my_bootom_navigation_bar.dart';
import 'package:hello_world/TabBar/tab_bar_page.dart';

class MyDrawerPage extends StatefulWidget {
  const MyDrawerPage({Key? key}) : super(key: key);

  @override
  State<MyDrawerPage> createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends State<MyDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Drawer Page"),
      //   centerTitle: false,
      // ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  "Flutter Learning",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Sign In"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBarPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_activity),
              title: Text("Sign Out"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBottomNavigationBar()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
