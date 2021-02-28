import 'package:equatable/equatable.dart';
import 'package:main_project/ElectionInfo/election_info.dart';

abstract class ElectionEvent extends Equatable {
  const ElectionEvent();
}

class ElectionLoad extends ElectionEvent {
  const ElectionLoad();

  @override
  List<Object> get props => [];
}

class ElectionCreate extends ElectionEvent {
  final Election election;

  const ElectionCreate(this.election);

  @override
  List<Object> get props => [election];

  @override
  String toString() => 'Election Created {party: $election}';
}

class ElectionUpdate extends ElectionEvent {
  final Election election;

  const ElectionUpdate(this.election);

  @override
  List<Object> get props => [election];

  @override
  String toString() => 'Election Updated {party: $election}';
}

class ElectionDelete extends ElectionEvent {
  final Election election;

  const ElectionDelete(this.election);

  @override
  List<Object> get props => [election];

  @override
  toString() => 'election Deleted {party: $election}';
}
