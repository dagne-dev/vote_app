// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_project/Home/screens/home_screen/home_screen.dart';
import 'package:main_project/PartyElection/bloc/bloc.dart';
import 'package:main_project/PartyElection/screens/party_add_update.dart';
import 'package:main_project/PartyElection/screens/party_detail.dart';
import 'package:main_project/PartyElection/screens/party_route.dart';
import 'package:main_project/components/constants.dart';

class PartyList extends StatelessWidget {
  static const routeName = '/parties';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      bottomNavigationBar: makeTheBottom(context),
      // appBar: AppBar(
      //   leading: Icon(Icons.how_to_vote_rounded),
      //   title: Text('Parties List'),
      //   backgroundColor: KPrimaryColor,
      // ),

      appBar: topAppBar,
      body: BlocBuilder<PartyBloc, PartyState>(
        builder: (_, state) {
          if (state is PartyOperationFailure) {
            return Center(
              child: Text(
                'No Party Added',
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          if (state is PartiesLoadSuccess) {
            final party = state.parties;
            // print(parties[0].description);///debug
            return ListView.builder(
              itemCount: party.length,
              itemBuilder: (_, idx) => ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                // leading: CircleAvatar(
                //   child: Text("${party[idx].partyName[0]}"),
                //   backgroundColor: Colors.blue,
                // ),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: Colors.white24))),
                  child: Icon(Icons.people, color: Colors.white),
                ),
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.white, size: 30.0),
                title: Text(
                  '${party[idx].partyName}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19.0),
                ),
                // subtitle: Text(
                //   '${party[idx].description}',
                //   style: TextStyle(color: Colors.white),
                // ),
                subtitle: Row(
                  children: <Widget>[
                    Icon(Icons.linear_scale, color: Colors.yellowAccent),
                    Text("${party[idx].headQuarter}",
                        style: TextStyle(color: Colors.white))
                  ],
                ),
                onTap: () => Navigator.of(context)
                    .pushNamed(PartyDetail.routeName, arguments: party[idx]),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context).pushNamed(
      //     AddUpdateParty.routeName,
      //     arguments: PartyArgument(edit: false),
      //   ),
      //   child: Icon(Icons.add),
      // ),
    );
  }

  Widget makeTheBottom(BuildContext context) {
    return Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  HomePageScreen.routeName,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () => Navigator.of(context).pushNamed(
                AddUpdateParty.routeName,
                arguments: PartyArgument(edit: false),
              ),
            ),
            // IconButton(
            //   icon: Icon(Icons.account_box, color: Colors.white),
            //   onPressed: () {},
            // )
          ],
        ),
      ),
    );
  }

  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    title: Text('Parties List'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ],
  );
}
