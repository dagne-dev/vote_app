import 'package:equatable/equatable.dart';
import 'package:main_project/PartyElection/models/models.dart';

abstract class PartyEvent extends Equatable {
  const PartyEvent();
}

class PartyLoad extends PartyEvent {
  const PartyLoad();

  @override
  List<Object> get props => [];
}

class PartyCreate extends PartyEvent {
  final Party party;

  const PartyCreate(this.party);

  @override
  List<Object> get props => [party];

  @override
  String toString() => 'party Created {party: $party}';
}

class PartyUpdate extends PartyEvent {
  final Party party;

  const PartyUpdate(this.party);

  @override
  List<Object> get props => [party];

  @override
  String toString() => 'party Updated {party: $party}';
}

class PartyDelete extends PartyEvent {
  final Party party;

  const PartyDelete(this.party);

  @override
  List<Object> get props => [party];

  @override
  toString() => 'party Deleted {party: $party}';
}
