import 'package:auth_learn/data/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';

class AuthData extends ChangeNotifier {
  bool _isBusy = false;
  bool get isBusy => _isBusy;

  AuthService authService = AuthService();

  setBusy() {
    _isBusy = true;
    notifyListeners();
  }

  setFree() {
    _isBusy = false;
    notifyListeners();
  }
}
