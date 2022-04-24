import 'package:auth_learn/components/register_background.dart';
import 'package:auth_learn/data/states/auth_provider/email_password_auth_data.dart';
import 'package:auth_learn/screens/authentication/provider_selection_screens.dart';
import 'package:auth_learn/widget/button/action_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class EmailPasswordScreen extends StatelessWidget {
  const EmailPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20, top: 70),
              child: Text(
                'Register',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
            ),
            SizedBox(height: 5),
            SignUpView()
          ],
        ),
      ),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;
  late String _name;
  late String _npm;
  late String _prodi;
  late String _dosenPa;
  late String _dosenTa;

  _onActionButtonTap() {
    _formKey.currentState!.save();

    EmailPasswordAuthData _emailPasswordAuthData =
        Provider.of<EmailPasswordAuthData>(context, listen: false);

    _emailPasswordAuthData.signUpUsingEmailAndPassword(
        email: _email,
        password: _password,
        name: _name,
        npm: _npm,
        prodi: _prodi,
        dosenPa: _dosenPa);
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
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _email = value!;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'Email', hintText: 'email@provider.com')),
              ),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  child: TextFormField(
                      onSaved: (value) {
                        setState(() {
                          _password = value!;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ))),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                    )),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _npm = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'NPM',
                    )),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _prodi = value!;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'Program Studi',
                        hintText: 'S1 Ilmu Komputer')),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _dosenPa = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Dosen PA',
                    )),
              ),
              SizedBox(height: 10),
              Consumer<EmailPasswordAuthData>(
                  builder: (context, emailPasswordAuthData, _) {
                return Container(
                    padding: EdgeInsets.only(left: 170, right: 20, top: 15),
                    child: ActionButton(
                      text: 'Daftar',
                      onPressed: _onActionButtonTap,
                      isBusy: emailPasswordAuthData.isBusy,
                    ));
              }),
              SizedBox(height: 10),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 26),
                  child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => ProviderSelectionScreen())),
                      child: Text(
                        'Sudah Punya Akun? Masuk Disini!',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                            color: Color.fromARGB(255, 230, 134, 9)),
                      ))),
            ],
          ),
        )
      ],
    );
  }
}
