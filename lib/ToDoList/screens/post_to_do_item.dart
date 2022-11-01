import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/to_do_model.dart';
import '../utilities/db_helper.dart';
import '../utilities/toast_utils.dart';

class PostToDoItem extends StatefulWidget {
  ToDoModel toDoModel;
  String appBarTitle;

  PostToDoItem({Key? key, required this.toDoModel, required this.appBarTitle})
      : super(key: key);

  @override
  State<PostToDoItem> createState() =>
      _PostToDoItemState(this.toDoModel, this.appBarTitle);
}

class _PostToDoItemState extends State<PostToDoItem> {
  ToDoModel toDoModel;
  String appBarTitle;

  final _statusList = ["Pending", "Completed"];

  var selectedStatus = "Pending";

  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController =
      TextEditingController();

  _PostToDoItemState(this.toDoModel, this.appBarTitle);

  @override
  void initState() {
    selectedStatus =
        toDoModel.status!.isEmpty ? "Pending" : toDoModel.status.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _titleEditingController.text = toDoModel.title!;
    _descriptionEditingController.text = toDoModel.description!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            DropdownButton(
              value: selectedStatus,
              items: _statusList.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (String? item) {
                setState(() {
                  selectedStatus = item!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _titleEditingController,
              decoration: const InputDecoration(
                  hintText: "Enter Title",
                  labelText: "Title",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionEditingController,
              decoration: const InputDecoration(
                  hintText: "Enter Description",
                  labelText: "Description",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_titleEditingController.text.isNotEmpty &&
                      _descriptionEditingController.text.isNotEmpty) {
                    validate();
                  } else {
                    ToastUtils.showRedToast(message: "Please Provide Data");
                  }
                },
                child: Text(appBarTitle),
              ),
            )
          ],
        ),
      ),
    );
  }

  // showRedToast({required String message}) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     gravity: ToastGravity.BOTTOM,
  //     backgroundColor: Colors.orange,
  //     toastLength: Toast.LENGTH_LONG,
  //   );
  // }

  validate() {
    toDoModel.title = _titleEditingController.text;
    toDoModel.description = _descriptionEditingController.text;
    toDoModel.status = selectedStatus;
    toDoModel.date = DateFormat.yMMMd().format(DateTime.now());

    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    if (toDoModel.id == null) {
      databaseHelper.insert(toDoModel);
    } else {
      databaseHelper.updateItem(toDoModel);
    }

    Navigator.pop(context, true);
  }
}
