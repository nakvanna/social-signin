import 'package:get/get.dart';
import 'package:social_login/controllers/shared-prefs-controller.dart';

class SharedPrefsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SharedPrefsController>(() => SharedPrefsController());
  }
}
