import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final List<Color> colors;
  final IconData iconData;
  final Function onPressed;
  final bool loading;
  SocialIcon(
      {required this.colors,
      required this.iconData,
      required this.onPressed,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.0),
      child: loading
          ? Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: colors,
                    tileMode: TileMode.clamp,
                  )),
              child: RawMaterialButton(
                shape: CircleBorder(),
                onPressed: null,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: colors,
                    tileMode: TileMode.clamp,
                  )),
              child: RawMaterialButton(
                shape: CircleBorder(),
                onPressed: () => onPressed(),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
