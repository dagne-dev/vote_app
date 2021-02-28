import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_project/ElectionInfo/election_info.dart';
// import 'package:main_project/Home/NavigationDrawer_screens/progress.dart';
import 'package:main_project/components/constants.dart';

class ElectionDetail extends StatelessWidget {
  static const routeName = '/electiondetails';
  final Election election;

  ElectionDetail({@required this.election});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        title: Text('Election ${this.election.electionYear}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateElection.routeName,
              arguments: ElectionArgument(election: this.election, edit: true),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<ElectionBloc>().add(ElectionDelete(this.election));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    ElectionList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Election: ${this.election.electionYear}'),
              subtitle: Text('Country: ${this.election.country}'),
            ),
            Column(
              children: [
                Text(
                  'Electoral Board Leader: ${this.election.boardLeader}',
                  style: TextStyle(color: Colors.black),
                ),
                // Text(
                //   'description: ${this.election.description}',
                //   style: TextStyle(color: Colors.black),
                // ),
                // Text(
                //   'Name: ${this.party.partyName}',
                //   style: TextStyle(color: Colors.black),
                // ),
                // Text(
                //   'Name: ${this.party.partyName}',
                //   style: TextStyle(color: Colors.black),
                // ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 35),
              child: Text(
                'Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              this.election.description,
              style: TextStyle(color: Colors.black87),
            ),
            // Padding(
            //     padding: EdgeInsets.only(top: 50.0),
            //     child: BlocBuilder<VoteBloc, bool>(
            //       builder: (_, likeB) => RaisedButton(
            //         color: likeB == true ? KSecondaryColor : KPrimaryColor,
            //         child: Text(likeB == true ? "Voted ✔" : "Vote",
            //             style: TextStyle(color: Colors.white, fontSize: 17.0)),
            //         // onPressed: likeB
            //         //     ? () {
            //         //         // voteBloc.add(VoteChangeEvent.increment);
            //         //         // _doSomething(context)
            //         //         // Navigator.of(context).pushNamed(
            //         //         //     PartyVoteProgress.routeName,
            //         //         //     arguments: this.party);
            //         //       }
            //         //     : null,
            //         onPressed: () {},
            //       ),
            //     )),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'dart:async';
// import 'package:main_project/PartyElection/bloc/bloc.dart';
// import 'package:main_project/PartyElection/bloc/vote_bool_bloc/vote_bool.dart';
// import 'package:main_project/PartyElection/bloc/vote_change_bloc/vote_change_bloc.dart';
// import 'package:main_project/PartyElection/models/models.dart';
// import 'package:main_project/PartyElection/party_election.dart';
// import 'package:main_project/PartyElection/screens/Parties_Vote_progress.dart';
// // import 'package:main_project/PartyElection/screens/Parties_Vote_progress.dart';
// import 'package:main_project/components/constants.dart';
// // import 'package:rounded_loading_button/rounded_loading_button.dart';

// class PartyDetail extends StatelessWidget {
//   static const routeName = '/partydetails';

//   // final RoundedLoadingButtonController _btnController =
//   //     new RoundedLoadingButtonController();
//   final Party party;

//   PartyDetail({@required this.party});

//   @override
//   Widget build(BuildContext context) {
//     // final VoteChangeBloc voteBloc = BlocProvider.of<VoteChangeBloc>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${this.party.partyName}'),
//         backgroundColor: KPrimaryColor,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () => Navigator.of(context).pushNamed(
//               AddUpdateParty.routeName,
//               arguments: PartyArgument(party: this.party, edit: true),
//             ),
//           ),
//           SizedBox(
//             width: 32,
//           ),
//           IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () {
//                 context.read<PartyBloc>().add(PartyDelete(this.party));
//                 Navigator.of(context).pushNamedAndRemoveUntil(
//                     PartyList.routeName, (route) => false);
//               }),
//         ],
//       ),
//       body: Card(
//         child: ListView(
//           children: [
//             ListTile(
//               title: Text('name: ${this.party.partyName}'),
//               subtitle: Text('region: ${this.party.headQuarter}'),
//             ),
//             Text(
//               'Party Detail',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(this.party.description),
//             Padding(
//               padding: EdgeInsets.all(30.0),
//               child: BlocBuilder<VoteChangeBloc, int>(
//                 builder: (context, voteNum) {
//                   return Text('${party.vote}');
//                 },
//               ),
//             ),
//             Padding(
//                 padding: EdgeInsets.all(25),
//                 child: BlocBuilder<VoteBloc, bool>(
//                     builder: (ctx, likeB) => BlocBuilder<VoteChangeBloc, int>(
//                           builder: (c, voteNum) => RaisedButton(
//                             color:
//                                 likeB == true ? KSecondaryColor : KPrimaryColor,
//                             child: Text(likeB == true ? "Voted ✔" : "Vote",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 17.0)),
//                             // onPressed: likeB
//                             //     ? () {
//                             //         // voteBloc.add(VoteChangeEvent.increment);
//                             //         // _doSomething(context)
//                             //         // Navigator.of(context).pushNamed(
//                             //         //     PartyVoteProgress.routeName,
//                             //         //     arguments: this.party);
//                             //       }
//                             //     : null,
//                             onPressed: () {},
//                           ),
//                         ))),
//             Padding(
//               padding: EdgeInsets.all(30),
//               child: FloatingActionButton(
//                 child: Icon(
//                   Icons.how_to_vote,
//                   color: Colors.white,
//                 ),
//                 backgroundColor: KPrimaryColor,
//                 onPressed: () => Navigator.of(context).pushNamed(
//                     PartyVoteProgress.routeName,
//                     arguments: this.party),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// //   _doSomething(BuildContext context) async {
// //     Timer(Duration(seconds: 1), () {
// //       _btnController.success();
// //     });
// //     // Navigator.pushNamed(context, PartyVoteProgress.routeName);
// //   }
// // }

// // RoundedLoadingButton(
// //                 color: KSecondaryColor,
// //                 child: Text('Vote',
// //                     style: TextStyle(color: Colors.white, fontSize: 17.0)),
// //                 controller: _btnController,
// //                 onPressed: () => {
// //                   // _doSomething(context)

// //                 },
// //               ),
