import 'package:flutter/material.dart';

class DynamicListViewExample extends StatelessWidget {
  const DynamicListViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic List View Example"),
        centerTitle: true,
      ),
      body: createListView(),
    );
  }

  List<String> generateListItems() {
    List<String> list =List.generate(21, (counter) => "Item $counter");
    return list;
  }
  Widget createListView() {

    var listItems = generateListItems();
    var listView = ListView.builder(itemCount:listItems.length,itemBuilder: (context,index) {

      return ListTile(
        title: Text(listItems[index]),
        leading: Icon(Icons.money),
        trailing: Icon(Icons.light),
        subtitle: Text("How are you"),
        onTap: () {
          print(listItems[index]);
        },
      );

    });

    return listView;
  }
}
