import 'package:auth_learn/enums/snackbar_type.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class Utils {
  static navigateTo(Widget destination) {
    try {
      OneContext().push(MaterialPageRoute(builder: (context) => destination));
    } catch (e) {
      print('Error while navigating : $e');
    }
  }

  static removeAllAndPush(Widget destination) {
    try {
      OneContext().pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => destination),
        (route) => false,
      );
    } catch (e) {
      print("Error while navigating : $e");
    }
  }

  static warningSnackBar(String msg) =>
      _showSnackBar(message: msg, snackbarType: SnackbarType.warning);

  static successSnackBar(String msg) =>
      _showSnackBar(message: msg, snackbarType: SnackbarType.success);

  static errorSnackBar(String msg) =>
      _showSnackBar(message: msg, snackbarType: SnackbarType.error);

  static _showSnackBar({
    required String message,
    required SnackbarType snackbarType,
  }) {
    late Color _color;

    switch (snackbarType) {
      case SnackbarType.success:
        _color = Colors.green;
        break;
      case SnackbarType.warning:
        _color = Colors.yellow;
        break;
      case SnackbarType.error:
        _color = Colors.red;
        break;
    }

    OneContext().showSnackBar(
        builder: (context) => SnackBar(
              content: Text(message),
              backgroundColor: _color,
            ));
  }
}
