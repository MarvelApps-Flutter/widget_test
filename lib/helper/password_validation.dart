import 'package:loginunittest/constant/constant_value.dart';

class PasswordFieldValidator {
  static String? validate(String value) {
    return value.isEmpty ? ConstantValue.PASSWORD_EMPTY : null;
  }
}
