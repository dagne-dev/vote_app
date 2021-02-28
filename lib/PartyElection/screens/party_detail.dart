import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_project/Home/NavigationDrawer_screens/progress.dart';
import 'package:main_project/PartyElection/bloc/vote_bool_bloc/vote_bool.dart';
import 'package:main_project/PartyElection/bloc/vote_change_bloc/vote_change.dart';
import 'package:main_project/PartyElection/models/models.dart';
import 'package:main_project/PartyElection/party_election.dart';
import 'package:main_project/PartyElection/screens/Parties_Vote_progress.dart';
import 'package:main_project/components/constants.dart';
import 'package:main_project/components/size_config.dart';

class PartyDetail extends StatelessWidget {
  static const routeName = '/partydetails';
  final Party party;

  PartyDetail({@required this.party});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('${this.party.partyName}'),
        actions: [
          IconButton(
            icon: Icon(Icons.how_to_vote),
            onPressed: () => Navigator.of(context).pushNamed(
              PartyVoteProgress.routeName,
              // arguments: PartyArgument(party: this.party, edit: true),
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateParty.routeName,
              arguments: PartyArgument(party: this.party, edit: true),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<PartyBloc>().add(PartyDelete(this
                    .party)); ///////////////////////////////////////////////
                Navigator.of(context).pushNamedAndRemoveUntil(
                    PartyList.routeName, (route) => false);
              }),
        ],
      ),
      body: ListView(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/parties/prosperity.png',
              height: getProportionateScreenHeight(250),
              width: getProportionateScreenWidth(225),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.reduce_capacity_outlined),
                  title: Text(
                    'Party: ${this.party.partyName}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'Leader: ${this.party.partyLeader}',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.location_city_rounded),
                  title: Text(
                    'HeadQuarter: ${this.party.headQuarter}',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.mic_none),
                  title: Text(
                    'Members in HPR: ${this.party.hpr}',
                    style: TextStyle(fontSize: 17.0),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: ListTile(
              leading: Icon(Icons.how_to_vote_sharp),
              title: Text(
                'Vote: ${this.party.vote}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text("Detailed Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                textAlign: TextAlign.center),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Text('${this.party.description}'),
          ),
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: BlocBuilder<VoteBloc, bool>(
                builder: (ctx, fav) => FloatingActionButton(
                    child: fav
                        ? Icon(
                            Icons.how_to_vote_rounded,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                    onPressed: () {
                      fav
                          ? context.read<PartyBloc>().add(PartyUpdate(Party(
                                id: this.party.id,
                                description: this.party.description,
                                headQuarter: this.party.headQuarter,
                                hpr: this.party.hpr,
                                partyLeader: this.party.partyLeader,
                                partyName: this.party.partyName,
                                vote: this.party.vote + 1,
                              )))
                          : context.read<PartyBloc>().add(PartyUpdate(Party(
                                id: this.party.id,
                                description: this.party.description,
                                headQuarter: this.party.headQuarter,
                                hpr: this.party.hpr,
                                partyLeader: this.party.partyLeader,
                                partyName: this.party.partyName,
                                vote: this.party.vote,
                              )));
                      context.read<VoteBloc>().add(VoteEvent.vote);
                    }),
              ))
        ],
      ),
    );
  }
}
