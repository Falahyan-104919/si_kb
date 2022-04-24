import 'package:flutter/material.dart';

class dropDownKonsul extends StatefulWidget {
  const dropDownKonsul({Key? key}) : super(key: key);

  @override
  State<dropDownKonsul> createState() => _dropDownKonsul();
}

class _dropDownKonsul extends State<dropDownKonsul> {
  String dropdownValue = 'Pribadi/Keluarga';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      icon: const Icon(Icons.arrow_downward),
      elevation: 1,
      style: const TextStyle(color: Colors.lightBlue),
      underline: Container(
        height: 2,
        color: Colors.lightBlueAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Pribadi/Keluarga', 'Akademik/Perkuliahan', 'Keuangan']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
