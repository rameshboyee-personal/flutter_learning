import 'package:flutter/material.dart';
Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    // color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData iconData,
    bool issPasswordType, TextEditingController controller, bool readOnly) {
  return TextField(
      controller: controller,
      readOnly: readOnly,
      obscureText: issPasswordType,
      enableSuggestions: !issPasswordType,
      autocorrect: !issPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
          prefix: Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Icon(
              iconData,
              color: Colors.white70,
            ),
          ),
          labelText: text,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          alignLabelWithHint: true,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white.withOpacity(0.3),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
      keyboardType: issPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress);
}

TextFormField reusableTextFormField(
    String text,
    {
      required IconData iconData,
    required bool issPasswordType,
    required TextEditingController controller,
    required bool readOnly,
      String? Function(String?)? validator,
    Function? onTap
    }
    ) {
  return TextFormField(
    controller: controller,
    validator: validator,
    readOnly: readOnly,
    obscureText: issPasswordType,
    enableSuggestions: !issPasswordType,
    autocorrect: !issPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
        prefix: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: Icon(
            iconData,
            color: Colors.white70,
          ),
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        alignLabelWithHint: true,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: issPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    onTap: () {
      onTap!();
    },
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.07,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        isLogin ? "LOG IN" : 'Sign Up',
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}
