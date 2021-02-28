import 'package:flutter_bloc/flutter_bloc.dart';

enum VoteEvent { vote }

class VoteBloc extends Bloc<VoteEvent, bool> {
  VoteBloc() : super(true);
  @override
  Stream<bool> mapEventToState(VoteEvent event) async* {
    if (event == VoteEvent.vote) {
      yield !state;
    }
  }
}
