import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login/helper/custom-fontstyle.dart';
import 'package:social_login/helper/info-const.dart';
import 'package:social_login/widgets/drawer.dart';
import 'package:social_login/widgets/screen_background.dart';

class HomeScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return screenBackground(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.indigo, Colors.cyan],
      scaffold: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'home-screen'.tr,
              style: CustomFontStyle.appTitleTextStyle(),
            ),
          ),
          body: SafeArea(
            child: Container(
              child: Center(
                // child: Text(InfoConst.googleUserInfo.value.toString()),
                child: Column(
                  children: [
                    Text(InfoConst.facebookUserInfo.toString()),
                    SizedBox(
                      height: 20,
                    ),
                    Text(InfoConst.googleUserInfo.value.toString()),
                  ],
                ),
              ),
            ),
          ),
          drawer: MyDrawer()),
    );
  }
}
