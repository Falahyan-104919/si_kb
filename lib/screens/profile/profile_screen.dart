import 'package:flutter/material.dart';

class profileScreen extends StatelessWidget {
  final String urlImage =
      'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?t=st=1648544420~exp=1648545020~hmac=46e59a2d7d8b3488e8397387e838e685c7c602724a5eb302d7a48f4a7833fc67&w=900';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: CircleAvatar(
                backgroundImage: NetworkImage(urlImage),
                radius: 175,
              ),
            ),
            Container(
              child: TextButton(
                  onPressed: () {}, child: Text('Ubah Foto Profile')),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: TextFormField(
                  initialValue: 'Username',
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Nama Lengkap',
                    filled: true,
                  ),
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: TextFormField(
                  initialValue: '1917051049',
                  textInputAction: TextInputAction.continueAction,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'NPM',
                    filled: true,
                  ),
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text('Program Studi'),
            ),
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: TextField(
                  textInputAction: TextInputAction.continueAction,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Program Studi',
                    filled: true,
                  ),
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: TextField(
                  textInputAction: TextInputAction.continueAction,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'No HP.',
                    filled: true,
                  ),
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: TextField(
                  textInputAction: TextInputAction.continueAction,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Dosen PA',
                    filled: true,
                  ),
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: TextField(
                  textInputAction: TextInputAction.continueAction,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Dosen TA/Skripsi/Tesis',
                    filled: true,
                  ),
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      primary: Colors.white,
                      backgroundColor: Colors.lightGreen,
                      minimumSize: Size(50, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                  onPressed: () {},
                  child: Text('Submit')),
            )
          ],
        ));
  }
}
