import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project/components/constants.dart';

class Information extends StatelessWidget {
  static String routeName = "/information";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        title: Text("Information"),
      ),
    );
  }
}
