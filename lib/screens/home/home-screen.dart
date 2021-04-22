import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
    );
  }
}
