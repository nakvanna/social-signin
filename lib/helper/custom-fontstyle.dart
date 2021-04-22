import 'package:flutter/material.dart';
import 'package:social_login/helper/info-const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFontStyle {
  static TextStyle appTitleTextStyle() {
    if (InfoConst.langCode.value == 'en') {
      return TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 32.sp,
      );
    } else {
      return TextStyle(
        fontFamily: 'Bokor',
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      );
    }
  }

  static TextStyle cardTitleTextStyle() {
    if (InfoConst.langCode.value == 'en') {
      return TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
      );
    } else {
      return TextStyle(
        fontFamily: 'Bokor',
        fontWeight: FontWeight.bold,
        fontSize: 22.sp,
      );
    }
  }

  static TextStyle labelTextStyle({bool isBold: false}) {
    if (InfoConst.langCode.value == 'en') {
      return TextStyle(
        fontFamily: 'Roboto',
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: 14.sp,
      );
    } else {
      return TextStyle(
        fontFamily: 'Battambang',
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: 12.sp,
      );
    }
  }

  static TextStyle linkLabelTextStyle({bool isBold: false}) {
    if (InfoConst.langCode.value == 'en') {
      return TextStyle(
        fontFamily: 'Roboto',
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: 14.sp,
        color: Colors.blue,
      );
    } else {
      return TextStyle(
        fontFamily: 'Battambang',
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: 12.sp,
        color: Colors.blue,
      );
    }
  }

  static TextStyle hintTextStyle() {
    if (InfoConst.langCode.value == 'en') {
      return TextStyle(
        fontFamily: 'Roboto',
        fontSize: 10.sp,
        color: Colors.grey,
      );
    } else {
      return TextStyle(
        fontFamily: 'Battambang',
        fontSize: 8.sp,
        color: Colors.grey,
      );
    }
  }

  static TextStyle authBtnLabelTextStyle() {
    if (InfoConst.langCode.value == 'en') {
      return TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20.sp,
      );
    } else {
      return TextStyle(
        fontFamily: 'Bokor',
        fontSize: 18.sp,
      );
    }
  }
}
