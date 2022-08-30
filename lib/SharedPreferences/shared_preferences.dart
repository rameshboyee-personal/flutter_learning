import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferencePage extends StatefulWidget {
  const MySharedPreferencePage({Key? key}) : super(key: key);

  @override
  State<MySharedPreferencePage> createState() => _MySharedPreferencePageState();
}

class _MySharedPreferencePageState extends State<MySharedPreferencePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController pswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getDataFromSharedPreference();
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Enter User Name", border: OutlineInputBorder()),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: pswdController,
              decoration: InputDecoration(
                  hintText: "Enter Password", border: OutlineInputBorder()),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: () async {
                  saveDataInSharedPreference(nameController.text.toString(),pswdController.text.toString());
                },
                child: Text("Fetch and Save Data"),
              ))
        ],
      ),
    );
  }

  void saveDataInSharedPreference(String name, String pswd) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("USER_NAME", name);
    sharedPreferences.setString("PASSWORD", pswd);
    print("Name and Password  Saved");
  }

  void getDataFromSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userName = sharedPreferences.getString("USER_NAME");
    String? pswd = sharedPreferences.getString("PASSWORD");
    nameController.text =userName!;
    pswdController.text =pswd!;



  }

}
