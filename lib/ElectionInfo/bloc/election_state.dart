import 'package:equatable/equatable.dart';
import 'package:main_project/ElectionInfo/election_info.dart';

class ElectionState extends Equatable {
  const ElectionState();

  @override
  List<Object> get props => [];
}

class ElectionLoading extends ElectionState {}

class ElectionsLoadSuccess extends ElectionState {
  final List<Election> elections;

  ElectionsLoadSuccess([this.elections = const []]);

  @override
  List<Object> get props => [elections];
}

class ElectionOperationFailure extends ElectionState {}
