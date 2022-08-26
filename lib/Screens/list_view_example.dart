import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View Example"),
        centerTitle: true,
      ),
      body: createListView(),
    );
  }

  Widget createListView() {
    var listView = ListView(
      padding: EdgeInsets.all(8),
      children:  <Widget>[
        ListTile(

          leading: Icon(Icons.phone),
          title: Text("Mobile Phone"),
          subtitle: Text("This is ListTile"),
          trailing: Icon(Icons.attach_money),
          onTap: () {
            print("Mobiles");
          },
        ),
        ListTile(
          leading: Icon(Icons.laptop_chromebook),
          title: Text("New Chrome Book"),
        ),
        Text("This is text in List View"),
        Text("This is text in List View"),
        Container(color: Colors.blueGrey,height: 78,child: Text("1.This is Container in List View\n 2.Build list View in Dynamic"),padding: EdgeInsets.all(8),)
      ],
    );

    return listView;
  }
}
