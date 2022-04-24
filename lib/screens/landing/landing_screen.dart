import 'package:auth_learn/widget/drawer/NavigationDrawerWidget.dart';
import 'package:auth_learn/widget/list/list_history_konsultasi_widget.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        body: Center(
          child: ListKonsultasiWidget(),
        ));
  }
}
