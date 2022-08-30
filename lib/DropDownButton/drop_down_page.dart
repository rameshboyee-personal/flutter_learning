import 'package:flutter/material.dart';

class MyDropDownPage extends StatefulWidget {
  const MyDropDownPage({Key? key}) : super(key: key);

  @override
  State<MyDropDownPage> createState() => _MyDropDownPageState();
}

class _MyDropDownPageState extends State<MyDropDownPage> {

  var countryList = [
    "Select Country",
    'India',
    'Chaina',
    'Pakistan',
    'America',
    'Russiya',
    'Japan'
  ];

  String selectedCountry= "Select Country";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drop Down"),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

          Center(
            child: DropdownButton(
                value: selectedCountry,
                items: countryList.map((item) {
                  return DropdownMenuItem(child: Text(item), value: item,);
                }
                ).toList(),
                onChanged: (item) {

                  setState(() {
                    selectedCountry =item.toString();
                  });

                }
            ),
          )

        ],

      ),
    );
  }
}
