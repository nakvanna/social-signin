import 'package:get/get.dart';
import 'package:social_login/controllers/shared-prefs.dart';

class SharedPrefsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SharedPrefs>(() => SharedPrefs());
  }
}
