import 'package:flutter/material.dart';
import 'package:practice/pages/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice/services/authentication.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:practice/models/User1.dart';
import 'package:practice/pages/wrapper.dart';
import 'package:practice/pages/counter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(Home());


  /*runApp(MaterialApp(

    initialRoute: '/home',
    routes: {
      '/home':(context)=>Home(),
      '/aboutus':(context)=>AboutUs(),
      '/start':(context)=>Start(),
      '/login':(context)=>MainPage(),
    },
  ),
  );*/

  }





class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User1?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value:AuthService().user,

      child: MaterialApp(

        //initialRoute: '/home',
        /*routes: {
          '/home':(context)=>Home(),
          '/aboutus':(context)=>AboutUs(),
          '/start':(context)=>Start(),
          '/login':(context)=>MainPage(),
        },
        */

        routes:{
          '/start':(context)=>Start(),
          '/aboutus':(context)=>Home(),
        },


        home:MainPage(),

        //home:MainPage(),

      ),

      )
    ;
  }
}