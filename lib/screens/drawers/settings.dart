// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pks_mobile/controllers/translation_controller.dart';
// import 'package:pks_mobile/helper/custom_font_style.dart';
// import 'package:pks_mobile/routes/app_pages.dart';
// import 'package:pks_mobile/widgets/screen_background.dart';
//
// class SettingScreen extends GetView<TranslationController> {
//   final CustomFontStyle customFontStyle = CustomFontStyle();
//   final List<Map<String, dynamic>> items = [
//     {
//       'onTab': () {
//         Get.toNamed(Routes.LANGUAGES, arguments: {'fromAuth': false});
//       },
//       'title': 'language',
//       'leading': null,
//       'trailing': Icon(Icons.chevron_right)
//     },
//     {
//       'onTab': () {},
//       'title': 'others',
//       'leading': null,
//       'trailing': Icon(Icons.chevron_right),
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return screenBackground(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [Colors.indigo, Colors.cyan],
//         scaffold: Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             title: Text('settings'.tr,
//                 style: customFontStyle.appBarTitleTextStyle()),
//           ),
//           body: ListView.separated(
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: items[index]['onTab'],
//                   child: ListTile(
//                     leading: items[index]['leading'],
//                     title: Text(
//                       items[index]['title'].toString().tr,
//                       style: customFontStyle.listTileMenuTextStyle(),
//                     ),
//                     trailing: items[index]['trailing'],
//                   ),
//                 );
//               },
//               separatorBuilder: (_, __) => Divider(height: 0.5),
//               itemCount: items.length),
//         ));
//   }
// }
