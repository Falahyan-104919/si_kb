// ignore_for_file: prefer_const_constructors

import 'package:auth_learn/data/services/auth_services.dart';
import 'package:auth_learn/screens/authentication/provider_selection_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'landing/landing_screen.dart';

class AuthStateBuilder extends StatelessWidget {
  const AuthStateBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().authChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return LandingScreen();
        }
        return ProviderSelectionScreen();
      },
    );
  }
}
