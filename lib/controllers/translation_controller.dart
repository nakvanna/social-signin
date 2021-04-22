import 'package:get/get.dart';
import 'dart:ui';

class TranslationController extends GetxController {
  void changeLanguage(String langCode, String? countryCode) {
    Locale _local = Locale(langCode, countryCode);
    Get.updateLocale(_local);
  }
}
