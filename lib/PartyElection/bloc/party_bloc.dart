import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_project/PartyElection/bloc/bloc.dart';
import 'package:main_project/PartyElection/party_election.dart';
// import 'package:main_project/PartyElection/repository/parties_repository.dart';

class PartyBloc extends Bloc<PartyEvent, PartyState> {
  final PartyRepository partyRepository;

  PartyBloc({@required this.partyRepository})
      : assert(partyRepository != null),
        super(PartyLoading());

  @override
  Stream<PartyState> mapEventToState(PartyEvent event) async* {
    if (event is PartyLoad) {
      yield PartyLoading();
      try {
        final parties = await partyRepository.getParties();
        yield PartiesLoadSuccess(parties);
      } catch (_) {
        yield PartyOperationFailure();
      }
    }

    if (event is PartyCreate) {
      try {
        await partyRepository.createParty(event.party);
        final parties = await partyRepository.getParties();
        yield PartiesLoadSuccess(parties);
      } catch (i) {
        print(i);
        yield PartyOperationFailure();
      }
    }

    if (event is PartyUpdate) {
      try {
        await partyRepository.updateParty(event.party);
        final party = await partyRepository.getParties();
        yield PartiesLoadSuccess(party);
      } catch (i, stacktrace) {
        print("////////////////////////////////////////$i"); //debug
        print(stacktrace);
        yield PartyOperationFailure();
      }
    }

    if (event is PartyDelete) {
      try {
        await partyRepository.deleteParty(event.party.id);
        final parties = await partyRepository.getParties();
        yield PartiesLoadSuccess(parties);
      } catch (_) {
        yield PartyOperationFailure();
      }
    }
  }
}
