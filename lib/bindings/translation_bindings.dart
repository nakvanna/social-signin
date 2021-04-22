import 'package:get/get.dart';
import 'package:social_login/controllers/translation_controller.dart';

class TranslationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TranslationController>(() => TranslationController());
  }
}
