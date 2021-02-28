// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:main_project/Home/screens/home_screen/home_screen.dart';
// import 'package:main_project/PartyElection/party_election.dart';
// // import 'package:main_project/PartyElection/screens/parties.dart';
// import 'package:main_project/components/constants.dart';

// class ElectionProgress extends StatelessWidget {
//   static String routeName = "/electionprogress";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: KPrimaryColor,
//         title: Text("Election Progress"),
//         actions: [
//           Padding(
//             padding: EdgeInsets.all(10.0),
//             child: GestureDetector(
//               onTap: () =>
//                   Navigator.pushNamed(context, HomePageScreen.routeName),
//               child: Icon(Icons.home),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10.0),
//             child: GestureDetector(
//               onTap: () => Navigator.pushNamed(context, PartyList.routeName),
//               child: Icon(Icons.how_to_vote_sharp),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
