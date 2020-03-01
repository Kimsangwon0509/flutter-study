import 'package:flutter/cupertino.dart';

class SessionItem extends ChangeNotifier {
  String _userId = '';
  String _userName = '';
  String _pumpId = '';

  String get userId => _userId;
  String get userName => _userName;
  String get pumpId => _pumpId;

  set userId(value) {
    _userId = value;
    notifyListeners();
  }

  set userName(value) {
    _userName = value;
    notifyListeners();
  }

  set pumpId(value) {
    _pumpId = value;
    notifyListeners();
  }
}
