
class MValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    //Regex for Email validation//
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    //Check for password length//
    if (value.length < 8) {
      return 'Password must be atleast 8 characters long';
    }

    //check for Uppercase in password//
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain atlease one uppercase letter.';
    }

    //Check for Number in password//
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password Must contain atleaset one Number';
    }

    //Check for special character in password//
    if (!value.contains(RegExp(r'[!@#$%^&*()<>?":|<>]'))) {
      return 'Password Must contain atleaset one special character';
    }
    return null;
  }

  //Validate Phone Number//
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }

    //Regex for Nigerian Phone Number//
    final phoneRegExp = RegExp(r'^\+234\d{10}$');
    if (phoneRegExp.hasMatch(value)) {
      return 'Invalid Phone number(A Nigeian phone Number required)';
    }
    return null;
  }
}
