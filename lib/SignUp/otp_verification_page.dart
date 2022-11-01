
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_world/SharedPreferences/AuthKey.dart';
import 'package:hello_world/SharedPreferences/AuthSharedPreferences.dart';
import 'package:hello_world/SignUp/password_verification_page.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../Utils/colors.dart';
import '../reusableWidgets/reusable_widgets.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  OtpFieldController otpController = OtpFieldController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getDataFromPrefs();
      setState(() {});
    });
  }

  String emailOrMobile = '';
  String otpPin = '';
  bool isEmail= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Otp Verification",
          style: TextStyle(fontSize: 24),
        ),
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
                logoWidget("assets/images/sayukth_logo.png"),
                Row(
                  children: [],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your Otp Verification code sent to $emailOrMobile",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28,
                ),
                otpField(),
                Divider(),

                verifyButton(() {
                  if (otpPin.length == 6) {
                      bool isOtpVerified = verifyOtp(otpPin);
                      if(isOtpVerified) {
                        Fluttertoast.showToast(msg: 'Otp Successfully Verified');
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PasswordVerificationPage()));
                      }
                  } else {
                    Fluttertoast.showToast(msg: 'Please enter Otp');
                  }



                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  getDataFromPrefs() async {
    AuthSharedPreferences authSharedPreferences = AuthSharedPreferences();
    emailOrMobile =
        (await authSharedPreferences.getString(AuthKey.EMAIL_MOBILE))!;
    isEmail = (await authSharedPreferences.getBool(AuthKey.IS_EMAIL))!;


  }

  OTPTextField otpField() {
    return OTPTextField(
        controller: otpController,
        length: 6,
        width: MediaQuery.of(context).size.width,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldWidth: 45,
        fieldStyle: FieldStyle.box,
        outlineBorderRadius: 15,
        style: TextStyle(fontSize: 17),
        onChanged: (pin) {
          print("Changed: " + pin);
          otpPin = pin;
        },
        onCompleted: (pin) {
          print("Completed: " + pin);
          otpPin = pin;
        });
  }

  ElevatedButton verifyButton(Function onTap) {
    return ElevatedButton(
      style: ButtonStyle(

      ),
      onPressed: onTap(),
      child: Text('Verify'),
    );
  }

    bool verifyOtp(String pin) {
      bool ret  =false;
      if(isEmail) {
        EmailAuth emailAuth = EmailAuth(sessionName: 'Sayukth');
        ret = emailAuth.validateOtp(recipientMail: emailOrMobile, userOtp: pin);
        print('ret:$ret');
      } else {

      }
      return ret;
    }
}
