import 'package:get/get.dart';

class FormValidator {
  passwordValidate({required String password}) {
    String? message;
    if (password.isEmpty)
      message = 'please-input-your-password!'.tr;
    else if (password.length < 6) message = 'password-at-least-6-characters'.tr;
    return message;
  }

  verifyValidate({required String first, required String second}) {
    return first != second ? 'password-not-match!'.tr : null;
  }

  emailValidate({required email}) {
    return email ? null : 'your-email-not-correct!'.tr;
  }

  usernameValidate({required String username}) {
    String? message;
    if (username != '' && username.length < 5)
      message = 'username-at-least-5-characters'.tr;
    else if (username == '') message = 'please-input-your-username'.tr;
    return message;
  }
}
