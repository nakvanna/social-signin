import 'package:flutter/material.dart';

Container screenBackground(
    {required Scaffold scaffold,
    required List<Color> colors,
    required Alignment begin,
    required Alignment end}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
      ),
    ),
    child: scaffold,
  );
}
