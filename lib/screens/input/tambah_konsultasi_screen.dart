import 'package:auth_learn/widget/dropdown/dropdown_dosen.dart';
import 'package:auth_learn/widget/dropdown/dropdown_konsultasi.dart';
import 'package:flutter/material.dart';

class tambahKonsultasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Konsultasi')),
      body: formKonsultasi(),
    );
  }

  Widget formKonsultasi() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Pilih Dosen',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          dropDownDosen(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Pilih Jenis Konsultasi',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          dropDownKonsul(),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Topik', border: OutlineInputBorder()),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                labelText: 'Keterangan', border: OutlineInputBorder()),
            maxLines: 3,
            keyboardType: TextInputType.multiline,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                labelText: 'Pesan',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent))),
            maxLines: 3,
            keyboardType: TextInputType.multiline,
          ),
          SizedBox(
            height: 10,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  primary: Colors.white,
                  backgroundColor: Colors.lightGreen,
                  minimumSize: Size(50, 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              onPressed: () {},
              child: Text('Submit'))
        ],
      ),
    );
  }
}
