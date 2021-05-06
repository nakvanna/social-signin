import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:social_login/helper/info-const.dart';
import 'package:social_login/routes/app_pages.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);

class SocialSignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final fb = FacebookLogin();

  @override
  void onInit() async {
    super.onInit();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      InfoConst.googleUserInfo.value = account;
    });
    _googleSignIn.signInSilently();
    await updateFacebookInfo();
  }

  Future<void> updateFacebookInfo() async {
    var fbToken = await fb.accessToken;
    if (fbToken != null) {
      InfoConst.facebookUserInfo.value = {
        "isLogin": await fb.isLoggedIn,
        "profile": await fb.getUserProfile() as FacebookUserProfile,
        "imageUrl": await fb.getProfileImageUrl(width: 150),
        "email": await fb.getUserEmail() ?? '',
      };
    }
  }

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignIn = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleSignIn!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      print('After process $googleSignIn');
      await _auth
          .signInWithCredential(credential)
          .then((value) => Get.offAllNamed(Routes.HOME));
    } catch (error) {
      Get.snackbar('Google sign-in error', '$error');
    }
  }

  Future<void> googleSignOut() async {
    try {
      var googleSignOut = await _googleSignIn.signOut();
    } catch (error) {
      Get.snackbar('Google sign-out error', '$error');
    }
  }

  Future<void> facebookSignIn() async {
    // Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.email,
    ]);

    switch (res.status) {
      case FacebookLoginStatus.success:
        await updateFacebookInfo();
        final FacebookAccessToken accessToken = res.accessToken!;
        print('Access token: ${accessToken.token}');

        final profile = await fb.getUserProfile();
        print('Hello, ${profile!.name}! You ID: ${profile.userId}');

        final imageUrl = await fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');

        final email = await fb.getUserEmail();
        print('Here email $email');
        if (email != null) print('And your email is $email');

        final AuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        await _auth
            .signInWithCredential(credential)
            .then((value) => Get.offAllNamed(Routes.HOME));

        break;
      case FacebookLoginStatus.cancel:
        print('Login cancel');
        break;
      case FacebookLoginStatus.error:
        print('Error while log in: ${res.error}');
        break;
    }
  }

  Future<void> facebookSignOut() async {
    try {
      var res = await fb.logOut();
    } catch (error) {
      Get.snackbar('Facebook sign-out error:', '$error');
    }
  }
}
