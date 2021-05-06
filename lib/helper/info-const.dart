import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class InfoConst {
  static Rx<GoogleSignInAccount?> googleUserInfo =
      Rx<GoogleSignInAccount?>(null);
  static RxMap<String, dynamic?> facebookUserInfo = RxMap<String, dynamic?>({});

  static var langCode = 'en'.obs;
}
