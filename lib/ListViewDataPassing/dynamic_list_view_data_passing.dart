import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_data_passed_page.dart';

class ListViewDataPassingExample extends StatelessWidget {
  const ListViewDataPassingExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic List View Data Passing Example"),
        centerTitle: true,
      ),
      body: createListView(),
    );
  }

  List<String> generateListItems() {
    // List<String> list =List.generate(21, (counter) => "Item $counter");
    List<String> list = ['Belize', 'Benin	', 'India', 'Bolivia', 'Brazil','Brunei'];

    return list;
  }

  Widget createListView() {
    var listItems = generateListItems();
    var listView = ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listItems[index]),
            leading: Icon(Icons.phone),
            trailing: Icon(Icons.arrow_forward),
            subtitle: Text("How are you"),
            onTap: () => goTOListDataPassedPage(context,listItems[index])
          );
        });

    return listView;
  }

  goTOListDataPassedPage(BuildContext context , String listStr) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ListViewDataPassedPage(listStr)));
  }
}
