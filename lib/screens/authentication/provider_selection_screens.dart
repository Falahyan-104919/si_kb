import 'package:auth_learn/components/login_background.dart';
import 'package:auth_learn/data/models/auth_provider_model.dart';
import 'package:auth_learn/data/states/auth_provider/email_password_auth_data.dart';
import 'package:auth_learn/screens/authentication/email/email_password_screen.dart';
import 'package:auth_learn/widget/button/action_button.dart';
import 'package:flutter/material.dart';
import 'package:auth_learn/utils/utils.dart';
import 'package:provider/provider.dart';

class ProviderSelectionScreen extends StatelessWidget {
  const ProviderSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Background(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 225,
              ),
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
            ),
            SizedBox(height: 10),
            SignUpView(),
          ],
        ),
      )),
    );
  }

  Widget _providerItem(AuthProviderModel providerModel) {
    return GestureDetector(
        onTap: () => Utils.navigateTo(providerModel.landingScreen),
        child: Text(
          'Belum Punya Akun? Daftar Disini!',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 13,
              color: Color.fromARGB(255, 230, 134, 9)),
        ));
  }
}

class SignUpView extends StatefulWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;

  _onActionButtonTap() {
    _formKey.currentState!.save();

    EmailPasswordAuthData _emailPasswordAuthData =
        Provider.of<EmailPasswordAuthData>(context, listen: false);

    _emailPasswordAuthData.signInUsingEmailAndPassword(
        email: _email, password: _password);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  child: TextFormField(
                      onSaved: (value) {
                        setState(() {
                          _email = value!;
                        });
                      },
                      decoration: InputDecoration(labelText: 'E-Mail')),
                ),
                SizedBox(height: 10),
                Container(
                  child: TextFormField(
                      onSaved: (value) {
                        setState(() {
                          _password = value!;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password')),
                ),
                SizedBox(height: 10),
                Consumer<EmailPasswordAuthData>(
                    builder: (context, emailPasswordAuthData, _) {
                  return Container(
                      padding: EdgeInsets.only(left: 155, right: 20, top: 15),
                      child: ActionButton(
                        text: 'Masuk',
                        onPressed: _onActionButtonTap,
                        isBusy: emailPasswordAuthData.isBusy,
                      ));
                }),
                SizedBox(height: 10),
                Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 26),
                    child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => EmailPasswordScreen())),
                        child: const Text(
                          'Tidak Punya Akun? Daftar Disini!',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                              color: Color.fromARGB(255, 230, 134, 9)),
                        ))),
              ],
            ))
      ],
    );
  }
}
