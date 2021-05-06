import 'package:get/get.dart';
import 'package:social_login/controllers/social-signin-controller.dart';

class SocialSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocialSignInController>(() => SocialSignInController());
  }
}
