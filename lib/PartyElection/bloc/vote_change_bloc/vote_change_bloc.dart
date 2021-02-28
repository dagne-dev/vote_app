// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum VoteChangeEvent { increment, decrement }

class VoteChangeBloc extends Bloc<VoteChangeEvent, int> {
  VoteChangeBloc() : super(0);

  @override
  Stream<int> mapEventToState(VoteChangeEvent event) async* {
    switch (event) {
      case VoteChangeEvent.increment:
        yield state + 1;
        break;
      case VoteChangeEvent.decrement:
        yield state - 1;
        break;
    }
  }
}
