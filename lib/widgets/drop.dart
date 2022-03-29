import 'package:flutter/material.dart';


class Drop extends StatefulWidget {
  const Drop({Key? key}) : super(key: key);

  @override
  State<Drop> createState() => Dropd();
}

class Dropd extends State<Drop> {
  String dropdownValue = 'sedentary active';

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
          height: 1,
          color: Colors.black,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['sedentary active','lightly active','moderately active','very active','extremely active']
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
