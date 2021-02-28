import 'package:flutter/cupertino.dart';

class VoteModel extends ChangeNotifier {
  bool _isFavourited = false;

  get isFavourited => _isFavourited;

  vote() {
    _isFavourited = !_isFavourited;
    notifyListeners();
  }
}
