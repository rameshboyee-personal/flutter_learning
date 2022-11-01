import 'package:flutter/material.dart';
import 'package:hello_world/Utils/validation_utils.dart';
import '../Utils/colors.dart';
import '../reusableWidgets/reusable_widgets.dart';

class fireBaseSignUp extends StatefulWidget {
  const fireBaseSignUp({Key? key}) : super(key: key);

  @override
  State<fireBaseSignUp> createState() => _fireBaseSignUpState();
}

class _fireBaseSignUpState extends State<fireBaseSignUp> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
                begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery
              .of(context)
              .size
              .height * 0.2, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                logoWidget("assets/images/sayukth_logo.png"),
                Divider(),
                reusableTextFormField(
                  'Email',
                  iconData: Icons.mail,
                  issPasswordType: false,
                  controller: _emailController,
                  readOnly: false,
                  validator: ValidationUtils.emailValidation
                ),
                Divider(),
                reusableTextFormField('Password', iconData: Icons.password,
                  issPasswordType: true,
                  controller: _passwordController,
                  readOnly: false,),
                Divider(),
                signInSignUpButton(context, false, () {
                }),

            _buildInputFields('Email', _emailController, TextInputType.emailAddress, Icons.ice_skating, Colors.transparent, ValidationUtils.addressValidation),




            ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildInputFields(
      String label,
      TextEditingController textController,
      TextInputType textInputType,
      IconData icon,
      Color iconColor,
      String? Function(String?) validator
      ) {
    return Container(
        margin: EdgeInsets.only(left: 20, bottom: 20),
        child: Container(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  controller: textController,
                  validator: validator,
                  style: new TextStyle(color: Colors.white),
                  keyboardType: textInputType,
                  decoration: InputDecoration(
                      labelText: label,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white30, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(icon, color: iconColor),
                        onPressed: () {},
                      )),
                ),
              ),
            ],
          ),
        ));
  }


  //username validator possible structure
  Function(String)? usernameValidator = (String username){
    if(username.isEmpty){
      return 'Username empty';
    }else if(username.length < 3){
      return 'Username short';
    }

    return null;
  };

  Container container() {
    double c_width = MediaQuery.of(context).size.width*0.8;

    return new Container (
      padding: const EdgeInsets.all(16.0),
      width: c_width,
      child: new Column (
        children: <Widget>[
          new Text ("Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ", textAlign: TextAlign.left),
          new Text ("Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2", textAlign: TextAlign.left),
        ],
      ),
    );

  }
  //80% of screen width





}


