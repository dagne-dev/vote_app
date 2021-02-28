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

            return ListView.builder(
              itemCount: parties.length,
              itemBuilder: (context, index) {
                return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    // leading: CircleAvatar(
                    //   backgroundColor: Colors.amber[700],
                    //   child: Text(
                    //     '${parties[index].partyName[0]}',
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(color: Colors.white, fontSize: 20.0),
                    //   ),
                    // ),
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
                    subtitle: BlocBuilder<VoteChangeBloc, int>(
                      builder: (context, count) {
                        return Expanded(
                          child: Text(
                            'Vote: ${parties[index].vote + count}',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                    trailing: BlocBuilder<VoteBloc, bool>(
                        builder: (ctx, fav) => BlocBuilder<VoteChangeBloc, int>(
                            builder: (c, i) => IconButton(
                                  icon: fav
                                      ? Icon(Icons.how_to_vote_rounded,
                                          color: Colors.white, size: 25.0)
                                      : Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                  onPressed: fav
                                      ? () {
                                          ctx
                                              .read<VoteBloc>()
                                              .add(VoteEvent.vote);
                                          c
                                              .read<VoteChangeBloc>()
                                              .add(VoteChangeEvent.increment);
                                        }
                                      : () {
                                          ctx
                                              .read<VoteBloc>()
                                              .add(VoteEvent.vote);
                                          c
                                              .read<VoteChangeBloc>()
                                              .add(VoteChangeEvent.decrement);
                                        },
                                ))));
              },
              // itemBuilder: (_, idx) => Card(
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           SizedBox(
              //             width: 20,
              //           ),
              //           Text("${parties[idx].partyName}",
              //               style: TextStyle(color: Colors.black87)),
              //           SizedBox(
              //             width: 30,
              //           ),
              //           BlocBuilder<VoteChangeBloc, int>(
              //             builder: (context, count) {
              //               return Expanded(
              //                 child: Text(
              //                   'Vote: ${parties[idx].vote}',
              //                   style: TextStyle(color: Colors.black),
              //                 ),
              //               );
              //             },
              //           ),
              //           SizedBox(
              //             width: 20,
              //           ),
              //           SizedBox(
              //             width: 140,
              //           ),
              //           BlocBuilder<VoteBloc, bool>(
              //               builder: (ctx, l) =>
              //                   BlocBuilder<VoteChangeBloc, int>(
              //                       builder: (c, i) => RaisedButton(
              //                             onPressed: () {
              //                               ctx
              //                                   .read<VoteBloc>()
              //                                   .add(VoteEvent.vote);
              //                               c
              //                                   .read<VoteChangeBloc>()
              //                                   .add(VoteChangeEvent.increment);
              //                             },
              //                             color: l ? Colors.blue : Colors.grey,
              //                             child: Text(
              //                               l ? "Vote" : "Voted",
              //                               style: TextStyle(
              //                                   color: l
              //                                       ? Colors.white
              //                                       : Colors.black),
              //                             ),
              //                           )))
              //         ],
              //       )
              //     ],
              //   ),
              //   // title: Text(
              //   //   '${parties[idx].partyName}',
              //   //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              //   // ),
              //   // subtitle: BlocBuilder<VoteChangeBloc, int>(
              //   //     builder: (ctx, i) => Text(
              //   //           'Current Vote: ${parties[idx].vote + i}',
              //   //           style: TextStyle(fontSize: 12.0, color: KTextColor),
              //   //         )),
              // ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
