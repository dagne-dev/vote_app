import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project/components/constants.dart';

class AccountInformation extends StatelessWidget {
  static String routeName = "/accountinformation";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Account Info'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
