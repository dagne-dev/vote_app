import 'package:flutter/widgets.dart';
import 'package:main_project/Home/NavigationDrawer_screens/account_info.dart';
import 'package:main_project/Home/NavigationDrawer_screens/information.dart';
import 'package:main_project/Home/NavigationDrawer_screens/progress.dart';
import 'package:main_project/Home/screens/home_screen/home_screen.dart';
import 'package:main_project/Home/splash/splash_screen.dart';
import 'package:main_project/PartyElection/party_election.dart';
import 'package:main_project/PartyElection/screens/Parties_Vote_progress.dart';
// import 'package:main_project/PartyElection/screens/parties.dart';
// import 'package:main_project/PartyElection/screens/parties_description.dart';

//All the routes will be avialable here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomePageScreen.routeName: (context) => HomePageScreen(),
  PartyList.routeName: (context) => PartyList(),
  // PartyVoteProgress.routeName: (context) => PartyVoteProgress(),
  // PartiesDescription.routeName: (context) => PartiesDescription(),/////////PartyDetail
  // ElectionProgress.routeName: (context) => ElectionProgress(),
  Information.routeName: (context) => Information(),
  AccountInformation.routeName: (context) => AccountInformation(),
};
