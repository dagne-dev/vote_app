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
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Notice Board'),
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
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Election: ${this.election.electionYear}',
                style: TextStyle(color: Colors.white70, fontSize: 16.0),
              ),
              subtitle: Text('Country: ${this.election.country}',
                  style: TextStyle(color: Colors.white70, fontSize: 16.0)),
            ),
            Column(
              children: [
                Text(
                  'Notice From: ${this.election.boardLeader}',
                  style: TextStyle(color: Colors.white70, fontSize: 17.0),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 35),
              child: Text(
                'Details',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              this.election.description,
              style: TextStyle(color: Colors.white60, fontSize: 15.0),
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
