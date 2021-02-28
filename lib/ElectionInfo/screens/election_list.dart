// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_project/ElectionInfo/election_info.dart';
import 'package:main_project/Home/screens/home_screen/home_screen.dart';
import 'package:main_project/components/constants.dart';

class ElectionList extends StatelessWidget {
  static const routeName = '/elections';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      bottomNavigationBar: makeTheBottom(context),
      body: BlocBuilder<ElectionBloc, ElectionState>(
        builder: (_, state) {
          if (state is ElectionOperationFailure) {
            return Center(
              child: Text(
                'No Description Added',
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          if (state is ElectionsLoadSuccess) {
            final election = state.elections;
            // print(parties[0].description);///debug
            return ListView.builder(
              itemCount: election.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text(
                  '${election[idx].country}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${election[idx].electionYear}'),
                onTap: () => Navigator.of(context).pushNamed(
                    ElectionDetail.routeName,
                    arguments: election[idx]),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context).pushNamed(
      //     AddUpdateElection.routeName,
      //     arguments: ElectionArgument(edit: false),
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
                Navigator.of(context).pushNamed(HomePageScreen.routeName);
              },
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () => Navigator.of(context).pushNamed(
                AddUpdateElection.routeName,
                arguments: ElectionArgument(edit: false),
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
    title: Text('Election Informations'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ],
  );
}
