import 'package:auth_learn/data/services/auth_services.dart';
import 'package:auth_learn/data/states/auth_data.dart';
import 'package:auth_learn/utils/custom_exception.dart';
import 'package:auth_learn/screens/auth_state_builder.dart';
import 'package:auth_learn/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordAuthData extends AuthData {
  bool _hasSelectedSignUpView = true;
  bool get getHasSelectedSignUpView => _hasSelectedSignUpView;

  toggleAuthView() {
    _hasSelectedSignUpView = !_hasSelectedSignUpView;
    notifyListeners();
  }

  signUpUsingEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String npm,
    required String prodi,
    required String dosenPa,
  }) async {
    try {
      setBusy();

      User user = await authService.signUp(
          email: email,
          password: password,
          nama: name,
          npm: npm,
          prodi: prodi,
          dosenPa: dosenPa);
      print("Signed up user\'s uid : ${user.uid}");

      Utils.removeAllAndPush(AuthStateBuilder());

      setFree();
    } on CustomException catch (e) {
      Utils.errorSnackBar(e.message);
      setFree();
    }
  }

  signInUsingEmailAndPassword(
      {required String email, required String password}) async {
    try {
      setBusy();
      await authService.signIn(email: email, password: password);
      Utils.removeAllAndPush(AuthStateBuilder());
      setFree();
    } on CustomException catch (e) {
      setFree();
      Utils.errorSnackBar(e.message);
    }
  }
}
