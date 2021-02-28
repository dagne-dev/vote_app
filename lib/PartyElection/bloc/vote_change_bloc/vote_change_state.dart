import 'package:flutter/cupertino.dart';

class VoteIncrementModel extends ChangeNotifier {
  int _num = 0;

  get num => _num;

  decrement() {
    _num--;
    notifyListeners();
  }

  increment() {
    _num++;
    notifyListeners();
  }
}
