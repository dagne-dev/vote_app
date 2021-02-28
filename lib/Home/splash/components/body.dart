import 'package:flutter/material.dart';
import 'package:main_project/Home/screens/home_screen/home_screen.dart';
import 'package:main_project/Home/splash/components/splash_content.dart';
import 'package:main_project/components/constants.dart';
import 'package:main_project/components/default_button.dart';
import 'package:main_project/components/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Compare the notions of your future leaders",
      // "image": "assets/images/party.png"
      "image": "assets/images/voting.png"
    },
    {
      "text": "Evaluate the parties with their ideas",
      // "image": "assets/images/compare.png"
      "image": "assets/images/discussion.png"
    },
    {
      "text": "Help your party to hold the power!",
      // "image": "assets/images/1.png"
      "image": "assets/images/candidate.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                image: splashData[index]["image"],
                text: splashData[index]["text"],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    DefaultButton(
                      text: 'Continue',
                      press: () {
                        Navigator.pushNamed(context, HomePageScreen.routeName);
                      },
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ))
        ],
      ),
    ));
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: KAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.white : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

// class BuildDot extends StatelessWidget {
//   const BuildDot({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 5),
//       height: 6,
//       width: 6,
//       decoration: BoxDecoration(
//         color: KPrimaryColor,
//         borderRadius: BorderRadius.circular(3),
//       ),
//     );
//   }
// }

// class SplashContent extends StatelessWidget {
//   const SplashContent({
//     Key key,
//     this.text,
//     this.image,
//   }) : super(key: key);

//   final String text, image;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Spacer(),
//         Text(
//           "CASSIOPEIA",
//           style: TextStyle(
//             fontSize: getProportionateScreenWidth(36),
//             color: KPrimaryColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(color: Colors.black),
//         ),
//         Spacer(flex: 2),
//         Image.asset(
//           image,
//           height: getProportionateScreenHeight(280),
//           width: getProportionateScreenWidth(265),
//         )
//       ],
//     );
//   }
// }
