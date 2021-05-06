import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_login/helper/info-const.dart';

class SharedPrefsController extends GetxController {
  static String langCodeKey = 'LANGUAGE_CODE';

  Future<void> setLanguage({required String langCode}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(langCodeKey, langCode);
    InfoConst.langCode.value = langCode;
  }

  Future<void> getLangCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    InfoConst.langCode.value = prefs.getString(langCodeKey) ?? 'en';
  }
}
