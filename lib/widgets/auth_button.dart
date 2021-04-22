import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_login/helper/custom-fontstyle.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final bool loading;
  final Function onPressed;

  AuthButton({this.label: '', this.loading: false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: loading
          ? Container(
              width: 150.w,
              height: 44.h,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff17ead9),
                    Color(0xff6078ea),
                  ]),
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff6078ea).withOpacity(.3),
                      offset: Offset(0.0, 8.0),
                      blurRadius: 8.0,
                    )
                  ]),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ))
          : Container(
              width: 150.w,
              height: 44.h,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff17ead9),
                    Color(0xff6078ea),
                  ]),
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff6078ea).withOpacity(.3),
                      offset: Offset(0.0, 8.0),
                      blurRadius: 8.0,
                    )
                  ]),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onPressed(),
                  child: Center(
                    child: Text(
                      label.tr,
                      style: CustomFontStyle.authBtnLabelTextStyle(),
                    ),
                  ),
                ),
              )),
    );
  }
}
