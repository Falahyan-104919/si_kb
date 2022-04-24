import 'package:auth_learn/widget/list/list_history_konsultasi_widget.dart';
import 'package:auth_learn/widget/list/list_konsultasi_widget.dart';
import 'package:flutter/material.dart';

import '../../data/services/auth_services.dart';
import '../../screens/profile/profile_screen.dart';
import '../../utils/custom_exception.dart';
import '../../utils/utils.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  final padding = EdgeInsets.symmetric(horizontal: 20);

  Widget build(BuildContext context) {
    final name = 'Username';
    final email = 'username@email.com';
    final urlImage =
        'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?t=st=1648544420~exp=1648545020~hmac=46e59a2d7d8b3488e8397387e838e685c7c602724a5eb302d7a48f4a7833fc67&w=900';

    return Drawer(
      child: Material(
        color: Colors.lightBlueAccent,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => profileScreen())),
            ),
            Container(
              padding: padding,
              child: Column(children: [
                const SizedBox(height: 24),
                buildMenuItem(
                    text: 'Konsultasi',
                    icon: Icons.question_answer,
                    onClicked: () => selectedMenu(context, 0)),
                const SizedBox(height: 16),
                buildMenuItem(
                    text: 'Riwayat Konsultasi',
                    icon: Icons.history,
                    onClicked: () => selectedMenu(context, 1)),
                const SizedBox(height: 16),
                buildMenuItem(
                    text: 'Log Out',
                    icon: Icons.logout,
                    onClicked: () async {
                      try {
                        await AuthService().signOut();
                        Utils.successSnackBar('Berhasil Log Out');
                      } on CustomException catch (e) {
                        Utils.errorSnackBar(e.message);
                      }
                    })
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 25, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )
                ],
              ),
              Spacer(),
              SizedBox(height: 30),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.lightBlueAccent,
                child: Icon(Icons.account_circle, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedMenu(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ListKonsultasiWidget(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ListHistoryKonsultasi(),
        ));
        break;
    }
  }
}
