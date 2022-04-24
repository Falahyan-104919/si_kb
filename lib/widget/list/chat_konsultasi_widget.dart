import 'package:flutter/material.dart';

class ChatKonsultasiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ruang Konsultasi'),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(child: Text('Akhiri Konsultasi')),
              PopupMenuItem(child: Text('Detail Konsultasi'))
            ];
          })
        ],
      ),
      body: ListView(
        children: [
          buildCardProfile(
              namaMhs: 'Falahyan',
              npmMhs: '1917051049',
              topik: 'Bimbingan Skripsi Bab I',
              ket: 'Batasan Masalah Bab I'),
          sendChat(
              waktu: '10.30',
              pesan:
                  'Assalamualaikum Wr. Wb. Maaf mengganggu waktunya pak, saya ingin membahas tentang sub-bab Bab I yaitu Batasan Masalah dari Skripsi saya. Adapun masalahnya yang ingin saya bahas yaitu mengenai Topik Penelitian saya'),
          recievedChat(waktu: '11.00', pesan: 'Waalaikumsalam Wr. Wb.'),
          recievedChat(
            waktu: '11.01',
            pesan:
                'Baik silahkan paparkan masalah mengenai Topik penelitian anda.',
          ),
        ],
      ),
    );
  }

  Widget buildCardProfile({
    required String namaMhs,
    required String npmMhs,
    required String topik,
    required String ket,
  }) =>
      Card(
        color: Colors.blueGrey,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama Mahasiswa : ' + namaMhs),
              Text('NPM : ' + npmMhs),
              Text('Topik : ' + topik),
              Text('Keterangan : ' + ket),
            ],
          ),
        ),
      );

  Widget sendChat({required String waktu, required String pesan}) => Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(waktu),
                  SizedBox(
                    height: 10,
                  ),
                  Text(pesan)
                ],
              ),
            )
          ],
        ),
        margin: EdgeInsets.only(top: 20, left: 150, right: 8.0),
        color: Colors.greenAccent,
      );

  Widget recievedChat({required String waktu, required String pesan}) => Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(waktu),
                  SizedBox(
                    height: 10,
                  ),
                  Text(pesan)
                ],
              ),
            )
          ],
        ),
        margin: EdgeInsets.only(top: 20, right: 150, left: 8.0),
        color: Colors.lightBlueAccent,
      );
}
