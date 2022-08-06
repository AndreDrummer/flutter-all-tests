import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:alltests/core/constants/strings.dart';

class Validators {
  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.requiredField;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null) return Strings.requiredField;
    if (GetUtils.isEmail(value)) return null;
    return Strings.invalideEmail;
  }
}
