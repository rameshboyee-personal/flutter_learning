import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtilsMethods {

  static Future<String> showDatePickerUtil({ required BuildContext context}) async {

    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2023));

    if (pickedDate != null) {
      String formattedDate =
      DateFormat('yyyy-MM-dd').format(pickedDate);

      print("formattedDate: $formattedDate");

      return formattedDate;
    } else {
      return "";
    }
  }


  static calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }



}