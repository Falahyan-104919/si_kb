import 'package:auth_learn/screens/input/tambah_konsultasi_screen.dart';
import 'package:auth_learn/widget/drawer/NavigationDrawerWidget.dart';
import 'package:auth_learn/widget/list/chat_konsultasi_widget.dart';
import 'package:flutter/material.dart';

class ListKonsultasiWidget extends StatelessWidget {
  final urlImage =
      'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?t=st=1648544420~exp=1648545020~hmac=46e59a2d7d8b3488e8397387e838e685c7c602724a5eb302d7a48f4a7833fc67&w=900';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Konsultasi'),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView(
        children: <Widget>[
          buildList(
              urlImage: urlImage,
              judulKons: 'Bimbingan Skripsi BAB I ',
              namaUser: 'Falahyan - 1917051049',
              onClicked: () => selectedList(context, 0)),
          buildList(
              urlImage: urlImage,
              judulKons: 'Bimbingan Laporan Kerja',
              namaUser: 'Vira Verina - 1917051042',
              onClicked: () => selectedList(context, 1)),
          buildList(
              urlImage: urlImage,
              judulKons: 'Bimbingan Studi Independent',
              namaUser: 'Cindy - 191705006',
              onClicked: () => selectedList(context, 2)),
          buildList(
              urlImage: urlImage,
              judulKons: 'Bimbingan Proposal Penelitian',
              namaUser: 'Melinda Sari - 1917051033',
              onClicked: () => selectedList(context, 3)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => tambahKonsultasi())),
        backgroundColor: Colors.blue.shade300,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildList({
    required String urlImage,
    required String judulKons,
    required String namaUser,
    VoidCallback? onClicked,
  }) =>
      Card(
          margin: EdgeInsets.all(2.5),
          elevation: 3.5,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(urlImage),
              radius: 25,
            ),
            title:
                Text(judulKons, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(namaUser),
            trailing: PopupMenuButton(
              itemBuilder: (context) {
                return [PopupMenuItem(child: Text('Akhiri Konsultasi'))];
              },
            ),
            onTap: onClicked,
          ));

  void selectedList(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatKonsultasiWidget(),
        ));
        break;
    }
  }
}
