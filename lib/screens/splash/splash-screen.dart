import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login/controllers/social-signin-controller.dart';

class SplashScreen extends GetView<SocialSignInController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialSignInController>(
      init: SocialSignInController(),
      builder: (_) => Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
