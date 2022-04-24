import 'package:auth_learn/widget/drawer/NavigationDrawerWidget.dart';
import 'package:flutter/material.dart';

class ListHistoryKonsultasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History Konsultasi')),
      drawer: NavigationDrawerWidget(),
      body: ListView(
        children: [
          historyKons(
            icon: Icon(
              Icons.query_builder,
              size: 35,
            ),
            judulKons: 'Bimbingan Skripsi Bab I',
            namaMhs: 'Falahyan - 1917051049',
            Colorstatus: Colors.red,
            status: 'Status : Sedang Berjalan',
          ),
          historyKons(
              icon: Icon(
                Icons.query_builder,
                size: 35,
              ),
              judulKons: 'Bimbingan Laporan KP',
              namaMhs: 'Vira Verina - 1917051042',
              Colorstatus: Colors.red,
              status: 'Status : Sedang Berjalan'),
          historyKons(
            icon: Icon(Icons.task_alt, size: 35),
            judulKons: 'Bimbingan Seminar Proposal',
            namaMhs: 'Melinda Sari 1917051023',
            Colorstatus: Colors.green,
            status: 'Status : Selesai',
          ),
          historyKons(
            icon: Icon(
              Icons.task_alt,
              size: 35,
            ),
            judulKons: 'Bimbingan Cuti Semester',
            namaMhs: 'Cindy - 1917051048',
            Colorstatus: Colors.green,
            status: 'Status : Selesai',
          ),
          historyKons(
            icon: Icon(
              Icons.task_alt,
              size: 35,
            ),
            judulKons: 'Bimbingan Kartu Rencana Studi',
            namaMhs: 'Fista Dwi Septiani - 1917051032',
            Colorstatus: Colors.green,
            status: 'Status : Selesai',
          ),
        ],
      ),
    );
  }

  Widget historyKons(
          {required String judulKons,
          required String namaMhs,
          required Color Colorstatus,
          required String status,
          required Widget icon,
          VoidCallback? lihatKons,
          Function? akhiri}) =>
      Card(
        margin: EdgeInsets.symmetric(vertical: 5.5, horizontal: 2),
        elevation: 3.5,
        color: Colorstatus,
        child: ListTile(
          isThreeLine: true,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [icon],
          ),
          trailing: PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text('Lihat Konsultasi'),
              )
            ];
          }),
          title: Text(
            judulKons,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Text(
                    namaMhs,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Row(
                children: [
                  Text(status,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.w700))
                ],
              )
            ],
          ),
          onTap: lihatKons,
        ),
      );

  lihatKonsultasi() {
    return null;
  }
}
