import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login/controllers/social-signin-controller.dart';
import 'package:social_login/helper/custom-fontstyle.dart';
import 'package:social_login/helper/info-const.dart';
import 'package:social_login/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height / 6,
            padding: EdgeInsets.only(top: size.height / 15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.pinkAccent],
              ),
            ),
            child: accountListTile(),
          ),
          Opacity(
            opacity: .75,
            child: Column(
              children: [
                drawerMenu(
                  onTap: () {},
                  icon: Icon(Icons.settings),
                  label: 'settings'.tr,
                ),
                drawerMenu(
                  onTap: () async {
                    if (InfoConst.googleUserInfo.value != null) {
                      await Get.put(SocialSignInController()).googleSignOut();
                    }
                    if (InfoConst.facebookUserInfo.isNotEmpty) {
                      await Get.put(SocialSignInController()).facebookSignOut();
                    }
                    await Get.offAllNamed(Routes.AUTH);
                  },
                  icon: Icon(Icons.logout),
                  label: 'logout'.tr,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell drawerMenu(
      {required Function onTap, required Icon icon, required String label}) {
    return InkWell(
      onTap: () => onTap(),
      child: ListTile(
        leading: icon,
        title: Text(
          label,
          style: CustomFontStyle.labelTextStyle(),
        ),
      ),
    );
  }

  Widget accountListTile() {
    if (InfoConst.googleUserInfo.value != null &&
        InfoConst.facebookUserInfo.isEmpty) {
      print('Google acc');
      return ListTile(
        leading: CachedNetworkImage(
          imageUrl: InfoConst.googleUserInfo.value!.photoUrl ??
              "http://via.placeholder.com/350x150",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Text(InfoConst.googleUserInfo.value!.displayName ?? ''),
        subtitle: Text(InfoConst.googleUserInfo.value!.email),
      );
    } else if (InfoConst.googleUserInfo.value == null &&
        InfoConst.facebookUserInfo.isNotEmpty) {
      print('Facebook acc');
      return ListTile(
        leading: CachedNetworkImage(
          imageUrl: InfoConst.facebookUserInfo['imageUrl']! ??
              "http://via.placeholder.com/350x150",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Text(InfoConst.facebookUserInfo['profile'].name ?? ''),
        subtitle: Text(InfoConst.facebookUserInfo['email'] ?? ''),
      );
    } else {
      print('Not login yet');
      return ListTile(
        leading: Icon(Icons.error),
        title: Text('Not sign-in yet'),
      );
    }
  }
}
