import 'package:flutter/material.dart';
import 'package:hello_world/ToDoList/screens/post_to_do_item.dart';


import '../models/to_do_model.dart';
import '../utilities/db_helper.dart';
import '../utilities/toast_utils.dart';
class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  List<ToDoModel>? _todoList;
  int count = 0;

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (_todoList == null) {
      _todoList = [];
      updateListView();
    }
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: const Text("TO DO List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetailsView(
              ToDoModel(title: "", description: "", status: "", date: ""),
              "Create Item");
        },
        child: const Icon(Icons.add),
      ),
      body: populateListView(),
    );
  }

  updateListView() async {
    _todoList = (await databaseHelper.getModelsFromMapList()).cast<ToDoModel>();

    setState(() {
      _todoList = _todoList;
      count = _todoList!.length;
    });
  }

  ListView populateListView() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          ToDoModel toDoModel = _todoList![index];
          return Card(
            color: toDoModel.status == "Pending"
                ? Colors.red[400]
                : Colors.green[400],
            child: GestureDetector(
              onTap: () {
                navigateToDetailsView(toDoModel, "Update Item");
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: toDoModel.status == "Pending"
                      ? const Icon(Icons.warning_amber_rounded)
                      : const Icon(Icons.done_all_rounded),
                ),
                trailing: toDoModel.status == "Completed"
                    ? GestureDetector(
                        onTap: () {
                          deleteItem(toDoModel, context);
                        },
                        child: const Icon(Icons.delete))
                    : null,
                iconColor: Colors.white,
                title: Text(toDoModel.title.toString()),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(toDoModel.description.toString()),
                    const SizedBox(height: 8.0),
                    Text(toDoModel.date.toString()),
                  ],
                ),
              ),
            ),
          );
        });
  }

  deleteItem(ToDoModel toDoModel, context) async {
    int result = await databaseHelper.delete(toDoModel);
    if (result != 0) {
      final snackBar = SnackBar(
        content: const Text('Item Delted Successfully'),
        action: SnackBarAction(
          label: 'close',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      updateListView();

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  navigateToDetailsView(ToDoModel toDoModel, String appBarTitle) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PostToDoItem(toDoModel: toDoModel, appBarTitle: appBarTitle);
    }));

    if (result) {
      // Fluttertoast.showToast(
      // msg: "Successfully Added Item",
      // toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.BOTTOM,
      // timeInSecForIosWeb: 1,
      // backgroundColor: Colors.green,
      // textColor: Colors.white,
      // fontSize: 16.0);
      ToastUtils.showGreenToast(message: "Successfully Added Item");
      updateListView();
    }
  }
}
