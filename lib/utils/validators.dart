import 'package:email_validator/email_validator.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';

class Validators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name.'.hardcoded;
    }
    if (value.length < 4) {
      return 'Name must be at least 4 characters long.'.hardcoded;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a email.'.hardcoded;
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email.'.hardcoded;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty.'.hardcoded;
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.'.hardcoded;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password cannot be empty.'.hardcoded;
    }
    if (value != password) {
      return 'Passwords do not match.'.hardcoded;
    }
    return null;
  }
}
