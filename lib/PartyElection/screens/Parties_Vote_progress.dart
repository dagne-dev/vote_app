// import 'package:flutter/gestures.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_project/Home/screens/home_screen/home_screen.dart';
import 'package:main_project/PartyElection/bloc/bloc.dart';
import 'package:main_project/PartyElection/bloc/vote_bool_bloc/vote_bool.dart';
import 'package:main_project/PartyElection/bloc/vote_change_bloc/vote_change.dart';
import 'package:main_project/PartyElection/party_election.dart';
import 'package:main_project/components/constants.dart';

class PartyVoteProgress extends StatelessWidget {
  static const routeName = '/partiesVote';

  final Party party;

  PartyVoteProgress({@required this.party});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Election Progress'),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, HomePageScreen.routeName),
              child: Icon(Icons.home),
            ),
          ),
          SizedBox(
            width: 18,
          )
        ],
      ),
      body: BlocBuilder<PartyBloc, PartyState>(
        builder: (_, state) {
          if (state is PartyOperationFailure) {
            return Center(
              child: Text(
                'No Votes',
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          if (state is PartiesLoadSuccess) {
            final parties = state.parties;
            List<bool> myMain = [];
            bool fal = false;
            return ListView.builder(
              itemCount: parties.length,
              itemBuilder: (context, index) {
                // myMain[index] = fal;
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 1.0, color: Colors.white24))),
                    child: Icon(Icons.people, color: Colors.white),
                  ),
                  title: Text(
                    parties[index].partyName,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0),
                  ),
                  subtitle: Expanded(
                    child: Text(
                      'Vote: ${parties[index].vote}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
