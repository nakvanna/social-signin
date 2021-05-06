import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login/controllers/shared-prefs-controller.dart';
import 'package:social_login/controllers/translation_controller.dart';
import 'package:social_login/helper/info-const.dart';
import 'package:social_login/routes/app_pages.dart';
import 'package:social_login/widgets/screen_background.dart';

class LanguageSettings extends GetView<TranslationController> {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'ភាសាខ្មែរ',
      'secondary': null,
      'langCode': 'kh',
      'countryCode': 'KH',
    },
    {
      'title': 'English',
      'secondary': null,
      'langCode': 'en',
      'countryCode': 'US',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return screenBackground(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.indigo, Colors.cyan],
      scaffold: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'language'.tr,
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Obx(
                () => CheckboxListTile(
                  value: InfoConst.langCode.value == items[index]['langCode'],
                  onChanged: (value) async {
                    await Get.find<SharedPrefsController>().setLanguage(
                      langCode: items[index]['langCode'],
                    );
                    controller.changeLanguage(
                        items[index]['langCode'], items[index]['countryCode']);
                    if (Get.arguments['isAuth'] == true) {
                      await Get.offAllNamed(Routes.AUTH);
                    } else {
                      await Get.offAllNamed(Routes.HOME);
                    }
                  },
                  secondary: items[index]['secondary'],
                  title: Text(items[index]['title']),
                ),
              );
            },
            separatorBuilder: (_, __) => Divider(height: 0.5),
            itemCount: items.length),
      ),
    );
  }
}
