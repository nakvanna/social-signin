import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_login/bindings/shared-prefs-binding.dart';
import 'package:social_login/controllers/shared-prefs-controller.dart';
import 'package:social_login/controllers/translation_controller.dart';
import 'package:social_login/helper/info-const.dart';
import 'package:social_login/routes/app_pages.dart';
import 'package:social_login/translations/text_translation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final translationController = TranslationController();

  _changeLocale({String? langCode}) {
    if (langCode == 'en') {
      translationController.changeLanguage('en', 'US');
    } else {
      translationController.changeLanguage('kh', 'KH');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        onInit: () async {
          await Get.find<SharedPrefsController>().getLangCode();
          await Future.delayed(Duration(seconds: 3), () {
            _changeLocale(langCode: InfoConst.langCode.value);
            if (InfoConst.googleUserInfo.value != null ||
                InfoConst.facebookUserInfo.isNotEmpty) {
              Get.offAllNamed(Routes.HOME);
            } else {
              Get.offAllNamed(Routes.AUTH);
            }
          });
        },
        initialBinding: SharedPrefsBinding(),
        theme: ThemeData(),
        locale: Locale('en', 'US'),
        translations: LabelTranslation(),
        getPages: AppPages.routes,
        initialRoute: Routes.SPLASH,
        title: 'Social Login',
      ),
    );
  }
}
