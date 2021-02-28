import 'package:flutter/material.dart';
import 'package:main_project/Home/screens/home_screen/home_screen.dart';
import 'package:main_project/Home/splash/splash_screen.dart';
import 'package:main_project/PartyElection/party_election.dart';
import 'package:main_project/PartyElection/screens/Parties_Vote_progress.dart';
import 'package:main_project/ElectionInfo/election_info.dart';

class ElectionAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == ElectionList.routeName) {
      return MaterialPageRoute(builder: (context) => ElectionList());
    }

    if (settings.name == AddUpdateElection.routeName) {
      ElectionArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddUpdateElection(
                args: args,
              ));
    }

    if (settings.name == ElectionDetail.routeName) {
      Election election = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => ElectionDetail(
                election: election,
              ));
    }

    return MaterialPageRoute(builder: (context) => ElectionList());
  }
}

class PartyArgument {
  final Party party;
  final bool edit;
  PartyArgument({this.party, this.edit});
}

// import 'package:flutter/material.dart';
// import 'package:main_project/Home/screens/home_screen/home_screen.dart';
// import 'package:main_project/Home/splash/splash_screen.dart';
// import 'package:main_project/PartyElection/models/models.dart';
// import 'package:main_project/PartyElection/screens/parties.dart';
// import 'package:main_project/PartyElection/screens/party_add_update.dart';
// import 'package:main_project/PartyElection/screens/party_detail.dart';
// import 'package:main_project/PartyElection/screens/party_list.dart';

// class PartyAppRoute {
//   static Route generateRoute(RouteSettings settings) {
//     if (settings.name == '/') {
//       return MaterialPageRoute(builder: (context) => SplashScreen());
//     }

//     if (settings.name == '/homePage') {
//       return MaterialPageRoute(builder: (context) => HomePageScreen());
//     }

//     if (settings.name == '/partiesList') {
//       return MaterialPageRoute(builder: (context) => PartiesList());
//     }

//     if (settings.name == AddUpdateParty.routeName) {
//       PartyArgument args = settings.arguments;
//       return MaterialPageRoute(
//           builder: (context) => AddUpdateParty(
//                 args: args,
//               ));
//     }

//     if (settings.name == PartyDetail.routeName) {
//       Party party = settings.arguments;
//       return MaterialPageRoute(
//           builder: (context) => PartyDetail(
//                 party: party,
//               ));
//     }

//     return MaterialPageRoute(builder: (context) => PartyList());
//   }
// }

// class PartyArgument {
//   final Party party;
//   final bool edit;
//   PartyArgument({this.party, this.edit});
// }

class ElectionArgument {
  final Election election;
  final bool edit;
  ElectionArgument({this.election, this.edit});
}
