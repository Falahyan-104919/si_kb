import 'package:flutter/material.dart';

class dropDownDosen extends StatefulWidget {
  const dropDownDosen({Key? key}) : super(key: key);

  @override
  State<dropDownDosen> createState() => _dropDownDosen();
}

class _dropDownDosen extends State<dropDownDosen> {
  String dropdownValue = 'Bambang Hermanto, S.Kom., M.Cs.';

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
      items: <String>[
        'Rico Andrian, S.Si., M.Kom.',
        'Bambang Hermanto, S.Kom., M.Cs.',
        'Aristoteles, S.Si., M.Kom.',
        'Dwi Sakethi, M.Kom.'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
