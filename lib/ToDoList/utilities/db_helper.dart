import 'dart:io';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/to_do_model.dart';

class DatabaseHelper {
  String tabelName = "to_do_list_table";
  String id = "id";
  String title = "title";
  String description = "description";
  String status = "status";
  String date = "date";

  static final DatabaseHelper instance = DatabaseHelper._instance();

  static Database? _db = null;

  DatabaseHelper._instance();

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "my_todo_list_database.db");
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database database, int version) async {
    await database.execute("""
      CREATE TABLE $tabelName (
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        $title TEXT,
        $description TEXT,
        $status TEXT,
        $date TEXT
      )
""");
  }

  Future<int> insert(ToDoModel toDoModel) async {
    Database? database = await db;
    var results = database!.insert(tabelName, toDoModel.toMap());
    print("Data Inserted");
    return results;
  }

  Future<List<Map<String, dynamic>>> getDatainMaps() async {
    Database? database = await db;
    return database!.query(tabelName,where:'$status ="Completed"' );
  }

  Future<List<ToDoModel>> getModelsFromMapList() async {
    List<Map<String, dynamic>> mapList = await getDatainMaps();

    List<ToDoModel> toDoListModel = [];

    for (int i = 0; i < mapList.length; i++) {
      toDoListModel.add(ToDoModel.fromMap(mapList[i]));
    }

    return toDoListModel;
  }

  Future<int> updateItem(ToDoModel toDoModel) async {
    Database? database = await db;
    return database!.update(tabelName, toDoModel.toMap(),
        where: "$id = ? ", whereArgs: [toDoModel.id]);
  }

  Future<int> delete(ToDoModel toDoModel) async {
    Database? database = await db;
    return database!
        .delete(tabelName, where: "$id = ? ", whereArgs: [toDoModel.id]);
  }
}
