import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_world/SharedPreferences/AuthKey.dart';
import 'package:hello_world/SharedPreferences/AuthSharedPreferences.dart';
import '../Utils/colors.dart';
import '../Utils/date_utils.dart';
import '../reusableWidgets/reusable_widgets.dart';

class PasswordVerificationPage extends StatefulWidget {
  const PasswordVerificationPage({Key? key}) : super(key: key);

  @override
  State<PasswordVerificationPage> createState() =>
      _PasswordVerificationPageState();
}

class _PasswordVerificationPageState extends State<PasswordVerificationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();


  int _checkedValue = 0;
  bool isEMail = false;
  @override
  void initState() {
    super.initState();
    getPrefsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Verification Page',
          style: TextStyle(fontSize: 24),
        ),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Name", Icons.person_outline, false, nameController, false),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                genderRadioButton(),
                Divider(),

                Container(
                  child: reusableTextFormField(
                      "DOB", iconData: Icons.calendar_today, issPasswordType: false, controller: dobController, readOnly: true,onTap: () async {
                    String date = await DateUtilsMethods.showDatePickerUtil(
                        context: context);
                    setState(() {
                      dobController.text = date;
                    });
                  }),
                ),

               Divider(),
                mailOrMobileFields(),
                Divider(),
                reusableTextField("Password", Icons.password_outlined, true,
                    passwordController, false),
                Divider(),
                reusableTextField("Confirm Password", Icons.password_outlined,
                    true, confirmPasswordController, false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column genderRadioButton() {
    return Column(
      children: [
        const Text(
          "What is your gender?",
          style: TextStyle(fontSize: 18),
        ),
        const Divider(),
        RadioListTile(
            title: const Text("Male"),
            value: 0,
            groupValue: _checkedValue,
            onChanged: (val) {
              setState(() {
                _checkedValue = 0;
                print("Selected Value $val");
              });
            }),
        RadioListTile(
            title: Text("Female"),
            value: 1,
            groupValue: _checkedValue,
            onChanged: (val) {
              setState(() {
                _checkedValue = 1;
              });
              print("Selected Value $val");
            }),
        RadioListTile(
            title: Text("Other"),
            value: 2,
            groupValue: _checkedValue,
            onChanged: (val) {
              setState(() {
                _checkedValue = 2;
              });
              print("Selected Value $val");
            })
      ],
    );
  }

  getPrefsData() async {
    AuthSharedPreferences authSharedPreferences = AuthSharedPreferences();
    isEMail = (await authSharedPreferences.getBool(AuthKey.IS_EMAIL))!;
  }


  TextField mailOrMobileFields() {
    getPrefsData();
    if(!isEMail) {
      return reusableTextField('Email', Icons.mail, false, mailController, false);
    } else {
      return reusableTextField('Mobile Number', Icons.mobile_friendly_outlined, false, mobileController, false);
    }

  }
}
