import 'package:flutter/material.dart';
import 'package:main_project/ElectionInfo/bloc/bloc.dart';
import 'package:main_project/ElectionInfo/election_info.dart';
import 'package:main_project/PartyElection/bloc/vote_bool_bloc/vote_bool.dart';
import 'package:main_project/PartyElection/bloc/vote_change_bloc/vote_change.dart';
// import 'package:main_project/Home/splash/splash_screen.dart';
import 'package:main_project/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:main_project/components/routes.dart';
import 'package:http/http.dart' as http;
import 'package:main_project/PartyElection/party_election.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final PartyRepository partyRepository = PartyRepository(
    dataProvider: PartyDataProvider(
      httpClient: http.Client(),
    ),
  );
  final ElectionRepository electionRepository = ElectionRepository(
    dataProvider: ElectionDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(
    PartyApp(
      partyRepository: partyRepository,
      electionRepository: electionRepository,
    ),
  );
}

class PartyApp extends StatelessWidget {
  final PartyRepository partyRepository;
  final ElectionRepository electionRepository;

  PartyApp({@required this.partyRepository, @required this.electionRepository})
      : assert(partyRepository != null && electionRepository != null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.partyRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PartyBloc(partyRepository: this.partyRepository)
                  ..add(PartyLoad()),
          ),
          BlocProvider(
            create: (context) =>
                ElectionBloc(dataRepository: this.electionRepository)
                  ..add(ElectionLoad()),
          ),
          BlocProvider<VoteChangeBloc>(
            create: (context) => VoteChangeBloc(),
          ),
          BlocProvider<VoteBloc>(
            create: (context) => VoteBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Election App',
          theme: new ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
            fontFamily: "Muli",
          ),
          onGenerateRoute: PartyAppRoute.generateRoute,
        ),
      ),
    );
  }
}
