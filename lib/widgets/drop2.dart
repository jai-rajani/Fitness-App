import 'package:flutter/material.dart';


class Drop2 extends StatefulWidget {
  const Drop2({Key? key}) : super(key: key);

  @override
  State<Drop2> createState() => Dropd2();
}

class Dropd2 extends State<Drop2> {
  String dropdownValue = 'lose weight';

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: DropdownButton<String>(
        dropdownColor: Colors.blue[100],
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['lose weight','maintain weight','gain weight']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
    ),
      );
  }
}
