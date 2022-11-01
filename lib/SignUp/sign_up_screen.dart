

import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_world/SharedPreferences/AuthKey.dart';
import 'package:hello_world/SharedPreferences/AuthSharedPreferences.dart';
import 'package:hello_world/SignUp/otp_verification_page.dart';
import 'package:hello_world/Utils/validation_utils.dart';
import '../Utils/colors.dart';
import '../reusableWidgets/reusable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailOrMobileController = TextEditingController();
  String phoneNumber='', verificationId='';
  String otp='', authStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10, top: 20),
            child: Text('Send Otp'),
          )
        ],
        elevation: 0,
        title: const Text(
          "Sign Up",
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
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email/Mobile Number",
                    Icons.person_outline, false, emailOrMobileController,false),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () async {
                  String? msg = ValidationUtils.mobileOrEmailValidator(
                      emailOrMobileController.text.toString());

                  if(!(msg==null || msg=='Email'|| msg=='Mobile')) {
                    Fluttertoast.showToast(msg: '$msg');
                  } else {
                    saveDetailsInPrefs(emailOrMobileController.text.toString(),msg!);
                    sendEmailOtp(emailOrMobileController.text.toString(),msg);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpVerificationPage()));
                  }

                  print("Message: $msg");
                  // verifyPhoneNumber(context);
                  // FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailOrMobileController.text.toString(), password: "Ramesh55@");
                  // FirebaseAuth.instance.verifyPhoneNumber


                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveDetailsInPrefs(String mailOrMobile,String msg) async {
    AuthSharedPreferences authSharedPreferences = AuthSharedPreferences();
    authSharedPreferences.putString(AuthKey.EMAIL_MOBILE, mailOrMobile);
    print('My Msg:$msg , $mailOrMobile');
    if(msg=='Email') {
      authSharedPreferences.putBool(AuthKey.IS_EMAIL, true);
    } else if(msg == 'Mobile') {
      authSharedPreferences.putBool(AuthKey.IS_EMAIL, false);
    }

  }

  void sendEmailOtp(String mailOrMobile, String key) async {
    print("Key:$key");
    if(key =='Email') {
      EmailAuth emailAuth = EmailAuth(sessionName: 'Sayukth');
      var res = await emailAuth.sendOtp(recipientMail: mailOrMobile);
      if(res) {
        print("OTP successfully sent to $mailOrMobile");
      }
    } else if(key == 'Mobile') {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: mailOrMobile,
          timeout: const Duration(seconds: 120),
          verificationCompleted: (PhoneAuthCredential credential) {
            print("Auth Completed");
          },

          verificationFailed: (FirebaseAuthException e) {
            print("Auth Failed");
          },
          codeSent: (String verificationId, int? resendToken) {
            AuthSharedPreferences authSharedPreferences = AuthSharedPreferences();
            authSharedPreferences.putString(AuthKey.VERIFICATION_ID, verificationId);
            authSharedPreferences.putString(AuthKey.RESEND_TOKEN, resendToken);
            print("OTP Sent");
          },

          codeAutoRetrievalTimeout: (String verificationId) {

          }
      );

    }

  }




  Future<void> verifyPhoneNumber(BuildContext context) async {
    phoneNumber = emailOrMobileController.text.toString();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
        setState(() {
          authStatus = "Your account is successfully verified";
        });
      },
      verificationFailed: (Exception authException) {
        setState(() {
          authStatus = "Authentication failed";
        });
      },
      codeSent: (String verId, [int? forceCodeResent]) {
        verificationId = verId;
        setState(() {
          authStatus = "OTP has been successfully send";
        });
        otpDialogBox(context).then((value) {});
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        setState(() {
          authStatus = "TIMEOUT";
        });
      },
    );
  }

  otpDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter your OTP'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30),
                    ),
                  ),
                ),
                onChanged: (value) {
                  otp = value;
                },
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // signIn(otp);
                },
                child: Text(
                  'Submit',
                ),
              ),
            ],
          );
        });
  }





}
