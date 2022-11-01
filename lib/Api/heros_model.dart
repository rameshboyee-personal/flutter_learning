
import 'dart:convert';

import 'package:flutter/services.dart';

class HerosModel {
  final String? name;

  final String? dob;

  final String? age;

  final String? numberOfMovies;

  final String? hitCount;
  final String? flopCount;
  final String? address;

  final String? image;

  HerosModel(this.name, this.dob, this.age, this.numberOfMovies, this.hitCount,
      this.flopCount, this.address, this.image);



  Map<String, dynamic> toMap() {
    Map<String, dynamic> herosMap = {};

    herosMap["name"] = name;
    herosMap["dob"] = dob;
    herosMap["age"] = age;
    herosMap["numberOfMovies"] = numberOfMovies;
    herosMap["hitCount"] = hitCount;

    herosMap["flopCount"] = flopCount;
    herosMap["address"] = address;
    herosMap["image"] = image;

    return herosMap;
  }

  factory HerosModel.fromMap(Map<String, dynamic> map) {
    String name = map["name"] as String;
    String dob = map["dob"] as String;
    String age = map["age"] as String;
    String numberOfMovies = map["numberOfMovies"] as String;
    String hitCount = map["hitCount"] as String;
    String flopCount = map["flopCount"] as String;
    String address = map["address"] as String;
    String image = map["image"] as String;

    return HerosModel(
        name, dob, age, numberOfMovies, hitCount, flopCount, address, image);
  }

   HerosModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        dob = json['dob'],
        age = json['age'],
        numberOfMovies = json['numberOfMovies'],
        hitCount = json['hitCount'],
        flopCount = json['flopCount'],
        address = json['address'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'dob': dob,
        'age': age,
        'numberOfMovies': numberOfMovies,
        'hitCount': hitCount,
        'flopCount': flopCount,
        'address': address,
        'image': image
      };

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/Api/heros.json');
  }

  static Future<List<HerosModel>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<List<HerosModel>> getListFromJson(List<dynamic> jsonArray) async {
    List<HerosModel> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(await HerosModel.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<HerosModel> getOne() async {
    return (await getDummyList())[0];
  }

}


