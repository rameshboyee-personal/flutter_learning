class ToDoModel {
  int? id;
  String? title;
  String? description;
  String? status;
  String? date;

  ToDoModel(
      {required this.title,
      required this.description,
      required this.status,
      required this.date});

  ToDoModel.withID(
      {required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.date});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();

    if (id != null) {
      map["id"] = id;
    }

    map["title"] = title;
    map["description"] = description;
    map["status"] = status;
    map["date"] = date;

    return map;
  }

  ToDoModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    description = map["description"];
    status = map["status"];
    date = map["date"];
  }
}
