import 'package:flutter/material.dart';
import 'package:hello_world/SharedPreferences/AuthKey.dart';
import 'package:hello_world/SharedPreferences/AuthSharedPreferences.dart';
import 'package:hello_world/ToDoList/screens/to_do_list_screen.dart';

import '../main.dart';
class MySharedPreferencePage extends StatefulWidget {
  const MySharedPreferencePage({Key? key}) : super(key: key);

  @override
  State<MySharedPreferencePage> createState() => _MySharedPreferencePageState();
}

class _MySharedPreferencePageState extends State<MySharedPreferencePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController pswdController = TextEditingController();

  AuthSharedPreferences? authSharedPreferences;

  bool? isDarkMode = false;



  @override
  Widget build(BuildContext context) {
    authSharedPreferences = AuthSharedPreferences();
    getDataFromSharedPreference();
    MaterialApp(
      theme: ThemeData(
        brightness:  isDarkMode!
        ? Brightness.light
        : Brightness.dark,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateDarkMode();
                  });

                },
                child: Icon(Icons.light_mode),
              ),
          )
        ],
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
              child: TextButton(
                onPressed: () async {
                  saveDataInSharedPreference(nameController.text.toString(),
                      pswdController.text.toString());
                },
                child: Text("Fetch and Save Data"),
              ))
        ],
      ),
    );
  }

  void saveDataInSharedPreference(String name, String pswd) async {
    authSharedPreferences?.putString(AuthKey.USER_NAME, name);
    authSharedPreferences?.putString(AuthKey.PASSWORD, pswd);
    print("Data Saved Sucessfully");

  }

  void getDataFromSharedPreference() async  {

    String? name = await authSharedPreferences?.getString(AuthKey.USER_NAME);
    String? password = await authSharedPreferences?.getString(AuthKey.PASSWORD);
    nameController.text = name!;
    pswdController.text = password!;

  }


  void updateDarkMode() async {
    isDarkMode = await authSharedPreferences?.getBool(AuthKey.IS_DARK_THEME) ;
   if(isDarkMode!=null) {
     authSharedPreferences?.putBool(AuthKey.IS_DARK_THEME, !isDarkMode!);
   } else {
     authSharedPreferences?.putBool(AuthKey.IS_DARK_THEME, true);

   }

   print("Dark Mode Status:$isDarkMode");

  }


}
