import '../constant/constant_value.dart';

class EmailFieldValidator {
  static String? validate(value) {
    return value.isEmpty ? ConstantValue.EMAIL_EMPTY : null;
  }
}
