import 'package:flutter/material.dart';
import 'package:practice/data/values.dart';
class result extends StatelessWidget {
  const result({Key? key}) : super(key: key);
  static const routeName = '/result';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Results',),
      ),
      body:
      Container(
      child:
      Text('hello',),
          ),
    );
  }
}

