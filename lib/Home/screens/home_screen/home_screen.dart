import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_project/ElectionInfo/election_info.dart';
import 'package:main_project/Home/NavigationDrawer_screens/account_info.dart';
import 'package:main_project/Home/NavigationDrawer_screens/information.dart';
// import 'package:main_project/Home/NavigationDrawer_screens/progress.dart';
import 'package:main_project/PartyElection/screens/Parties_Vote_progress.dart';
import 'package:main_project/components/constants.dart';
import 'package:main_project/components/size_config.dart';
import 'package:main_project/PartyElection/party_election.dart';

class HomePageScreen extends StatelessWidget {
  static String routeName = "/homePage";
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          new Container(
            child: new DrawerHeader(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("R"), //assets/images/rob.JPG
                ),
                title: Text(
                  "Robel Azmera",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                subtitle: Text(
                  "09198133--",
                  style: TextStyle(color: Colors.white70, fontSize: 12.0),
                ),
              ),
              decoration: new BoxDecoration(
                color: Color.fromRGBO(58, 66, 86, 1.0),
              ),
            ),
            color: Color.fromRGBO(58, 66, 86, 1.0),
          ),
          // Divider(
          //   height: 1,
          //   thickness: 1,
          // ),
          new Container(
            height: 800,
            color: Color.fromRGBO(58, 66, 86, 0.9),
            child: new Column(children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Account Info',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AccountInformation.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.how_to_vote),
                title: Text(
                  'Election progress',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, PartyVoteProgress.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'Information',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, ElectionList.routeName);
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app_sharp),
                title: Text(
                  'Exit',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                onTap: () => SystemNavigator.pop(),
              ),
            ]),
            // // DrawerHeader(
            // //   decoration: BoxDecoration(
            // //       image: DecorationImage(
            // //           image: AssetImage("assets/images/rob.JPG"),
            // //           fit: BoxFit.cover)),
            // //   child: Text("Header"),
            // // ),
          )
        ]),
      ),
      appBar: AppBar(
        elevation: 0.1,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Election App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      // appBar: AppBar(
      //   backgroundColor: KPrimaryColor,
      //   leading: Builder(
      //     builder: (context) => IconButton(
      //       icon: new Icon(Icons.menu),
      //       onPressed: () => Scaffold.of(context).openDrawer(),
      //     ),
      //   ),
      //   title: Text("Election 2021"),
      //   actions: [Icon(Icons.more_vert)],
      // ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            // child: Image.asset("assets/images/election.png",
            //     height: getProportionateScreenHeight(180),
            child: Icon(
              Icons.people,
              size: 55,
              color: Colors.white,
            ),
            //     width: getProportionateScreenWidth(270)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Text(
              "Electoral Terms And Conditions",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60, fontSize: 16.0),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                Terms,
                textScaleFactor: 1.05,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white38, fontSize: 13.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 17.0, right: 40.0, bottom: 40.0),
            child: GestureDetector(
              child: Text(
                "Continue",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              onTap: () {
                Navigator.pushNamed(context, PartyList.routeName);
              },
            ),
          )
        ],
      ),
    );
  }
}
