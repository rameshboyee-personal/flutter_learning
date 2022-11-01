
class ValidationUtils {

  static final String EMAIL_REG = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  static final String USER_REG=r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  static final String PASSWORD_REG =r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";

  static final String MOBILE_REG =  r'^(?:[+0][1-9])?[0-9]{10,12}$';

  static final EMP_REG = r'^[a-zA-z]';



  static String? emailValidation(String? email) {
    String pattern = EMAIL_REG;
    RegExp regex = RegExp(pattern);
    if (email == null || email.isEmpty || !regex.hasMatch(email)) {
      print("Hello");
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }
  static String? usernmaeValidation(String? username) {
    print("usernmaeValidation");
    String pattern = USER_REG;
    RegExp regex = RegExp(pattern);
    if (username == null || username.isEmpty || !regex.hasMatch(username)) {
      return 'Enter a valid username';
    } else {
      return null;
    }
  }

  static String? mobileValidation(String? mobile ) {
    String pattern = MOBILE_REG;
    RegExp regExp = new RegExp(pattern);

    if (mobile == null || mobile.isEmpty || !regExp.hasMatch(mobile)) {
      return 'Enter a valid mobile number';
    } else {
      return null;
    }

  }

  static String? nameValidation(String? name ) {
    if (name == null || name.isEmpty ) {
      return 'Enter Name';
    } else if(name.length<3 || name.length>64) {
      return "Enter a valid name";

    } else {
      return null;
    }

  }
  static String? addressValidation(String? address ) {
    if (address == null || address.isEmpty ) {
      return 'Enter address';
    } else if(address.length<8 || address.length>128) {
      return "Enter a valid address";

    } else {
      return null;
    }

  }

  static String? validateAadhaar(String? aadhaar) {

    if(aadhaar == null || aadhaar.isEmpty) {
      return "Enter Aadhaar Number ";
    }

  }
  static String? validateage(String? age) {

    if(age == null || age.isEmpty) {
      return "Enter employee age ";
    }

  }
  static String? dateofbirthValidation(String? dob) {

    if(dob == null || dob.isEmpty) {
      return "Enter Date Of Birth ";
    }

  }

  static String? employeeValidation(String? employee) {
    String pattern = EMP_REG ;
    RegExp regex = RegExp(pattern);
    if (employee == null || employee.isEmpty || !regex.hasMatch(employee)) {
      return 'Enter a valid employee id';
    } else {
      return null;
    }
  }

  static String? salaryValidation(String? salary) {

    double  salaryDouble ;

    print("Salary:$salary");

    if (salary == null || salary.isEmpty) {
      return 'Enter Salary';
    } else {

      salaryDouble = double.parse(salary);

      if((salaryDouble < 10000 || salaryDouble >50000)) {
        return "Salary must be in the range of 10000-50000";
      } else {

        return null;
      }

    }
  }
  static String? passwordValidation(String? password) {
    String pattern = PASSWORD_REG;
    RegExp regex = RegExp(pattern);
    if (password == null || password.isEmpty || !regex.hasMatch(password)) {
      return 'Password should contains at least one Capital letter, one Special Character and at least one number ';
    } else {
      return null;
    }
  }

  static String? validateUserName(String? name) {
    bool? ret = hasText(name);

    if(ret!) {
      return "Enter user name";
    }
    return null;
  }

  static String? validateUserPassword(String? name) {
    bool? ret = hasText(name);
    if(ret!) {
      return "Enter user password";
    }
    return null;
  }

  static bool? hasText(String? text) {

    if (text.toString().isEmpty) {
      return true;
    }

    return false;

  }


  static String? mobileOrEmailValidator(String emailOrMobile) {

    String mobileReg = MOBILE_REG;
    RegExp mobileRegExp = RegExp(mobileReg);

    String emailReg = EMAIL_REG;
    RegExp emailRegExp = RegExp(emailReg);

    if(emailOrMobile.isEmpty) {
      return 'Enter Email/Mobile Number';
    } else if((!emailRegExp.hasMatch(emailOrMobile))  && ( !mobileRegExp.hasMatch(emailOrMobile))) {
      return 'Enter Valid Email/Mobile Number';
    } else if(mobileRegExp.hasMatch(emailOrMobile)) {
      return 'Mobile';
    } else if(emailRegExp.hasMatch(emailOrMobile)) {
      return 'Email';
    }
    return null;



  }


}