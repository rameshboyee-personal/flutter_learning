import 'package:flutter/material.dart';
import 'package:hello_world/ListViewDataPassing/dynamic_list_view_data_passing.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {

  var tabList =[Icon(Icons.camera),ListViewDataPassingExample(),Icon(Icons.star),Icon(Icons.home)];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            title: Text("WhatsApp"),
            centerTitle: false,
            backgroundColor: Colors.teal,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.camera_alt_rounded),
                  iconMargin: EdgeInsets.all(10),
                ),

                Tab(
                 text: "CHATS",
                ),

                Tab(
                  text: "STATUS",

                ),

                Tab(
                 text: "CALLS",
                ),
                // Tab(text: Text("CHATS"),)
              ],
            )
        ),
        body: TabBarView(children:tabList)
      ),
    );
  }
}
