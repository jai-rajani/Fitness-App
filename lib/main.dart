import 'package:flutter/material.dart';
import 'package:practice/pages/about.dart';
import 'package:practice/pages/start.dart';
import 'package:practice/pages/result.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:practice/pages/aboutus.dart';
import 'package:practice/pages/login.dart';
void main() {
  runApp(MaterialApp(

    initialRoute: '/login',
    routes: {

      '/aboutus':(context)=>AboutUs(),
      '/start':(context)=>Start(),
      '/login':(context)=>LoginPage(),
    },
  ),);
  }




class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body:
      Column(
        children: [
          Image.asset('assets/232672.jpg'),
          Text('$counter'),
        ],

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.pushNamed(context, '/about');

        },

        child: Icon(Icons.add),
      ),
    );
  }
}