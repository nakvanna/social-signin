import 'package:get/get.dart';
import 'package:social_login/bindings/translation_bindings.dart';
import 'package:social_login/controllers/translation_controller.dart';
import 'package:social_login/screens/auth/auth-screen.dart';
import 'package:social_login/screens/drawers/sub_drawers/languages.dart';
import 'package:social_login/screens/home/home-screen.dart';
import 'package:social_login/screens/splash/splash-screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthScreen(),
    ),
    GetPage(
        name: _Paths.SETTING,
        page: () => LanguageSettings(),
        binding: TranslationBinding()),
  ];
}
