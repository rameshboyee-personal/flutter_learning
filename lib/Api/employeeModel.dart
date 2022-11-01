
import 'dart:convert';

import 'package:flutter/services.dart';
List<EmployeeModel> employeeFromJson(String str) => List<EmployeeModel>.from(json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeToJson(List<EmployeeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
  EmployeeModel({
    required this.name,
    required this.fitsName,
    required this.employeeId,
    required this.dob,
    required this.address,
    required this.aadhaar,
  });

  String name;
  String fitsName;
  String employeeId;
  String dob;
  String address;
  String aadhaar;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    name: json["name"],
    fitsName: json["fitsName"],
    employeeId: json["employeeId"],
    dob: json["dob"],
    address: json["address"],
    aadhaar: json["aadhaar"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "fitsName": fitsName,
    "employeeId": employeeId,
    "dob": dob,
    "address": address,
    "aadhaar": aadhaar,
  };

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/Api/employee.json');
  }

  static Future<List<EmployeeModel>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }


  static Future<List<EmployeeModel>> getListFromJson(List<dynamic> jsonArray) async {
    List<EmployeeModel> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(await EmployeeModel.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<EmployeeModel> getOne() async {
    return (await getDummyList())[0];
  }
}
