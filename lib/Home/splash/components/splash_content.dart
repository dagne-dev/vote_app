import 'package:flutter/material.dart';
import 'package:main_project/components/constants.dart';
import 'package:main_project/components/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "CASSIOPEIA",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white60),
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(280),
          width: getProportionateScreenWidth(265),
        )
      ],
    );
  }
}
