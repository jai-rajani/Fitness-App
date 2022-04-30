
import 'package:practice/main.dart';
import 'package:practice/pages/login.dart';
import  'package:practice/pages/aboutus.dart';
import 'package:practice/pages/start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/User1.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User1?>(context);
    if(user!=null){
      final now = DateTime.now();
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(DateTime.now());
      print(now);
      print(formatted);
    print('THis '+(user?.uid).toString());}

    if(user==null) {
      return LoginPage();
    }
    else{
        return AboutUs();
    }
  }
}

