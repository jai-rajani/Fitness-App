import 'package:flutter/material.dart';
import 'package:practice/pages/about.dart';
import 'package:practice/pages/start.dart';
import 'package:practice/pages/result.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/start',
    routes: {
      result.routeName:(context)=>const result(),
      '/home': (context) => Home(),
      '/start':(context)=>Start(),
      '/about': (context) => about(),
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