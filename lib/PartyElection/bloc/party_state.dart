import 'package:equatable/equatable.dart';
import 'package:main_project/PartyElection/models/models.dart';

class PartyState extends Equatable {
  const PartyState();

  @override
  List<Object> get props => [];
}

class PartyLoading extends PartyState {}

class PartiesLoadSuccess extends PartyState {
  final List<Party> parties;

  PartiesLoadSuccess([this.parties = const []]);

  @override
  List<Object> get props => [parties];
}

class PartyOperationFailure extends PartyState {}
