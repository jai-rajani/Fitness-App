import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice/pages/counter.dart';
import 'package:practice/services/authentication.dart';
import 'package:practice/services/authentication.dart';
import 'package:practice/pages/start.dart';
import 'package:practice/services/database.dart';
import 'package:provider/provider.dart';

import '../models/User1.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final AuthService _auth=AuthService();
  bool isloading=false;
  int checkDate=0;
  
  //const AboutUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(DateTime.now());
    //final String formatted ='5-05-2022';
    //initalising user
    User1? user = Provider.of<User1?>(context);

    //getting collection database
    final CollectionReference   testCollection = FirebaseFirestore.instance
        .collection('test').doc(user!.uid).collection('nwstedTest');

    //function to get data from database
    Future<void> getData() async {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await testCollection.get();

      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();


      for (int i = 0; i < allData.length; i++) {
        Map<String, dynamic> map = allData[i] as Map<String, dynamic>;
        if(formatted==map['date']){
          print('present');
          checkDate=1;
          break;
        }
      }
      if(checkDate==0){
        print('not present');

        //create database for not present date
        await DatabaseService(uid:user!.uid).addEntry(user!.uid, formatted, 0);


      }


    }

    return Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(

          title: Text(
            'About Us',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 22.0,
            ),
          ),

          actions: <Widget>[
            TextButton(

              onPressed: () async{

                Navigator.push(context, MaterialPageRoute(builder: (context) => const Start())
                );


              },
              child: Text("Start",
                  style:TextStyle(
                    fontSize: 17,
                    color:Colors.white,
                  )),

            ),
            TextButton(

              onPressed: () async{
                  await _auth.signout();
                  print('signed out');
                  //Navigator.pushNamed(context, '/home');

              },
              child: Text("Sign Out",
                  style:TextStyle(
                    fontSize: 17,
                    color:Colors.white,
                  )),

            ),


          ],
          centerTitle: true,
          backgroundColor: Colors.grey[800],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/fitness.jpg'),
                  radius: 50.0,
                ),
              ),
              SizedBox(height: 10.0),
              Center(child: Text(
                "Don't decrease the goal. Increase the effort!",
                style: TextStyle(
                  color: Color(0xfff5f5dc),
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(height: 30.0),
              Card(
                color: Colors.grey[800],
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        child: Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )
                        ),
                        padding: EdgeInsets.all(10.0),
                      ),
                    ),
                    Divider(height: 10.0,thickness: 0.35, color: Colors.white),
                    Container(
                      child: Text(
                        'Fitness apps are applications designed by companies to keep you fit and healthy. These apps can be downloaded on mobile phones quite easily. The aim of these apps is to make your lifestyle healthier by tracking your food intake, water intake and workout pattern.',
                        style: TextStyle(
                          color: Color(0xfff5f5dc),
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                      padding: EdgeInsets.all(10.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                color: Colors.grey[800],
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        child: Text(
                            'US',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )
                        ),
                        padding: EdgeInsets.all(10.0),
                      ),
                    ),
                    Divider(height: 10.0,thickness: 0.60, color: Colors.white),
                    Container(
                      height: 40,
                      width: 500,
                      child: Text(
                        'UCHIT MODY : 16010120030',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfff5f5dc),
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(10.0,15.0,10.0,0.0),
                    ),
                    Container(
                      height: 40,
                      width: 500,
                      child: Text(
                          'RAHIL PARIKH : 16010120037',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff5f5dc),
                          )
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    Container(
                      height: 40,
                      width: 500,
                      child: Text(
                          'JAI RAJANI : 16010120041',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff5f5dc),
                          )
                      ),
                      padding: EdgeInsets.fromLTRB(10.0,5.0,10.0,0.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                color: Colors.grey[800],
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        child: Text(
                            'REFERENCES',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )
                        ),
                        padding: EdgeInsets.all(10.0),
                      ),
                    ),
                    Divider(height: 10.0,thickness: 0.50, color: Colors.white),
                    Container(
                      height: 40,
                      width: 500,
                      child: Text(
                        'https://www.calculator.net/bmr-calculator.html',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfff5f5dc),
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(10.0,15.0,10.0,0.0),
                    ),
                    Container(
                      height: 40,
                      width: 500,
                      child: Text(
                          'https://www.bodybuilding.com/fun/calculate-your-total-daily-energy-expenditure-tdee.html',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff5f5dc),
                          )
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}