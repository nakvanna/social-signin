import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login/helper/custom-fontstyle.dart';
import 'package:social_login/helper/form_validator.dart';
import 'package:social_login/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_login/widgets/auth_button.dart';

class SignInForm extends GetWidget {
  SignInForm(this.formKey);
  final formValidator = FormValidator();
  final formKey;

  // final email = Rx<TextEditingController?>(null);
  // final password = Rx<TextEditingController?>(null);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 15.0),
              blurRadius: 15.0,
            ),
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, -10.0),
              blurRadius: 10.0,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'sign-in'.tr,
                    style: CustomFontStyle.cardTitleTextStyle(),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.SETTING, arguments: {'isAuth': true});
                    },
                    color: Colors.grey[600],
                    icon: Icon(Icons.settings),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    'email'.tr,
                    style: CustomFontStyle.labelTextStyle(),
                  ),
                ],
              ),
              TextFormField(
                validator: ((email) =>
                    formValidator.emailValidate(email: email!.isEmail)),
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'email'.tr,
                  hintStyle: CustomFontStyle.hintTextStyle(),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Icon(Icons.lock),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    'password'.tr,
                    style: CustomFontStyle.labelTextStyle(),
                  ),
                ],
              ),
              TextFormField(
                validator: ((password) =>
                    formValidator.passwordValidate(password: password!)),
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  hintText: 'password'.tr,
                  hintStyle: CustomFontStyle.hintTextStyle(),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'forget-password?'.tr,
                    style: CustomFontStyle.linkLabelTextStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16.w,
                      ),
                      Container(
                        width: 16.w,
                        height: 16.h,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 2.0, color: Colors.black)),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'remember-me!'.tr,
                        style: CustomFontStyle.labelTextStyle(),
                      ),
                    ],
                  ),
                  AuthButton(
                    label: 'sign-in',
                    loading: false,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        print(email.text);
                        print(password.text);
                      }
                    },
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
