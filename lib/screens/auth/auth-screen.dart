import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_login/controllers/social-signin-controller.dart';
import 'package:social_login/helper/custom-fontstyle.dart';
import 'package:social_login/helper/custom_icon.dart';
import 'package:social_login/helper/form_validator.dart';
import 'package:social_login/helper/info-const.dart';
import 'package:social_login/widgets/signin-form.dart';
import 'package:social_login/widgets/signup-form.dart';
import 'package:social_login/widgets/social_icon.dart';

class AuthScreen extends GetView<SocialSignInController> {
  final formKey = GlobalKey<FormState>();
  final formValidator = FormValidator();
  final isSignUp = false.obs;
  final isSocialSignIn = false.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialSignInController>(
      builder: (ctrl) => Scaffold(
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Opacity(
                      opacity: .6,
                      child: Image.asset(
                        'assets/images/login.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(maxHeight: double.infinity),
                    ),
                  ),
                  Image.asset(
                    'assets/images/building.png',
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/logo.png',
                            width: 64,
                            height: 64,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'social-login'.tr,
                            style: CustomFontStyle.appTitleTextStyle(),
                          ),
                        ],
                      ),
                      Obx(
                        () => SizedBox(
                          height: isSignUp.value ? 16.h : 48.h,
                        ),
                      ),
                      Obx(() => isSignUp.value
                          ? SignUpForm(formKey)
                          : SignInForm(formKey)),
                      Obx(
                        () => SizedBox(
                          height: isSignUp.value ? 16.h : 32.h,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          horizontalLine(),
                          Text(
                            'social-login'.tr,
                            style: CustomFontStyle.labelTextStyle(isBold: true),
                          ),
                          horizontalLine(),
                        ],
                      ),
                      Obx(
                        () => SizedBox(
                          height: isSignUp.value ? 8.h : 16.h,
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Obx(
                              () => SocialIcon(
                                colors: [
                                  Color(0xff102397),
                                  Color(0xff187adf),
                                  Color(0xff00eaf8),
                                ],
                                loading: isSocialSignIn.value,
                                iconData: CustomIcon.facebook,
                                onPressed: () async {
                                  isSocialSignIn.value = !isSocialSignIn.value;
                                  await ctrl.facebookSignIn();
                                  isSocialSignIn.value = !isSocialSignIn.value;
                                },
                              ),
                            ),
                            Obx(
                              () => SocialIcon(
                                colors: [
                                  Color(0xffff4f38),
                                  Color(0xffff355d),
                                ],
                                iconData: CustomIcon.google,
                                loading: isSocialSignIn.value,
                                onPressed: () async {
                                  isSocialSignIn.value = !isSocialSignIn.value;
                                  await ctrl.googleSignIn();
                                  isSocialSignIn.value = !isSocialSignIn.value;
                                },
                              ),
                            ),
                            Obx(
                              () => SocialIcon(
                                colors: [
                                  Color(0xff666360),
                                  Color(0xff5e564e),
                                ],
                                loading: isSocialSignIn.value,
                                iconData: CustomIcon.apple,
                                onPressed: () {},
                              ),
                            ),
                          ]),
                      Obx(
                        () => SizedBox(
                          height: isSignUp.value ? 8.h : 24.h,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'new-user?'.tr,
                            style: CustomFontStyle.labelTextStyle(isBold: true),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          InkWell(
                            onTap: () {
                              isSignUp.value = !isSignUp.value;
                            },
                            child: Obx(
                              () => Text(
                                isSignUp.value ? 'signIn'.tr : 'signUp'.tr,
                                style: CustomFontStyle.linkLabelTextStyle(
                                    isBold: true),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 80.0.w,
          height: 2.0.h,
          color: Colors.red.withOpacity(.3),
        ),
      );
}
