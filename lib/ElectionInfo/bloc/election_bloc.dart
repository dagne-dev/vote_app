import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_project/ElectionInfo/election_info.dart';
// import 'package:main_project/PartyElection/repository/parties_repository.dart';

class ElectionBloc extends Bloc<ElectionEvent, ElectionState> {
  final ElectionRepository dataRepository;

  ElectionBloc({@required this.dataRepository})
      : assert(dataRepository != null),
        super(ElectionLoading());

  @override
  Stream<ElectionState> mapEventToState(ElectionEvent event) async* {
    if (event is ElectionLoad) {
      yield ElectionLoading();
      try {
        final elections = await dataRepository.getElections();
        yield ElectionsLoadSuccess(elections);
      } catch (_) {
        yield ElectionOperationFailure();
      }
    }

    if (event is ElectionCreate) {
      try {
        await dataRepository.createElection(event.election);
        final elections = await dataRepository.getElections();
        yield ElectionsLoadSuccess(elections);
      } catch (i) {
        print(i);
        yield ElectionOperationFailure();
      }
    }

    if (event is ElectionUpdate) {
      try {
        await dataRepository.updateElection(event.election);
        final election = await dataRepository.getElections();
        yield ElectionsLoadSuccess(election);
      } catch (_) {
        // print(i); debug
        yield ElectionOperationFailure();
      }
    }

    if (event is ElectionDelete) {
      try {
        await dataRepository.deleteElection(event.election.id);
        final elections = await dataRepository.getElections();
        yield ElectionsLoadSuccess(elections);
      } catch (_) {
        yield ElectionOperationFailure();
      }
    }
  }
}
