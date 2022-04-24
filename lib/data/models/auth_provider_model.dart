import 'package:auth_learn/screens/authentication/email/email_password_screen.dart';
import 'package:auth_learn/screens/landing/landing_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthProviderModel {
  String name;
  IconData icon;
  Widget landingScreen;

  AuthProviderModel(
      {required this.name, required this.icon, required this.landingScreen});
}

AuthProviderModel emailProvider = AuthProviderModel(
    name: 'Email/Password',
    icon: Icons.email,
    landingScreen: EmailPasswordScreen());

final List<AuthProviderModel> availableProviders = <AuthProviderModel>[
  emailProvider,
];
