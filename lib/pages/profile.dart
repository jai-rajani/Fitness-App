import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:practice/models/User1.dart';
import 'package:practice/pages/aboutus.dart';
import 'package:practice/pages/loading.dart';
import 'package:practice/services/database.dart';
import 'package:practice/widgets/details.dart';
import 'package:provider/provider.dart';

import '../services/authentication.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Color backcolor = Color(0xff222831);
    Color boxcolor = Color(0xffEEEEEE);
    User1? user = Provider.of<User1?>(context);
    return StreamBuilder<UserData>(

        stream: DatabaseService(uid: user!.uid).usersStream,

        builder: (context, snapshot) {
          print(snapshot);

          if (snapshot.hasData) {
            UserData? usersStream = snapshot.data;
            String name="";
            int height=0;
            int weight=0;
            int age=0;

            String activity="";
            String goal="";
            String bmi="";
            String tdee="";
            String totalcalorie="";
            try {
                  name = (usersStream!.name);
                  height = (usersStream!.height);
                  weight = (usersStream!.weight);
                  age = (usersStream!.age);
                  bmi=(usersStream!.bmi);
                  activity = (usersStream!.activity);
                  goal = (usersStream!.goal);
                  tdee = (usersStream!.tdee);
                  totalcalorie = (usersStream!.totalcalorie);

            }catch(e){
                  print('catch');

            }
            print("WORKING");


            return Scaffold(
                backgroundColor: backcolor,
                appBar: AppBar(

                      title: Text('Fitness App'),
                      centerTitle: true,
                      backgroundColor: Colors.black,
                      actions: <Widget>[
                      TextButton(

                            onPressed: () async{
                              Navigator.pushNamed(context, '/aboutus');
                            },
                            child: Text("About Us",
                            style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            )),

                      ),
                      ],
                      ),
                body: SingleChildScrollView(

                  child:
                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                            Container(
                              padding: EdgeInsets.fromLTRB(80, 20, 0, 20),
                              child: Text('Welcome Back, '+name,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  )),
                            ),

                            

                          Row(
                            children: [
                              Details(type:"Height",data: (height.toString()+' cm ')),
                              Details(type:"Weight",data: weight.toString()+' kg '),

                            ],
                          ),

                          Row(
                            children:[
                              Details(type:"BMI",data: bmi),
                              Details(type:"Age",data: age.toString()+' years '),

                            ]
                          ),



                          Row(
                            children:[
                              Details(type:"Activity Level",data: activity),
                              Details(type:"Fitness Goal",data: goal),

                            ]
                          ),
                          Row(
                            children:[
                          Details(type:"TDEE",data: tdee),
                          Details(type:"Total Calories",data: totalcalorie+ ' calories'),
                              ],
                          ),

                       ],
                        ),
                    ),
              );


                            }
          else {
          print(user.uid);
          return Loading();
          }
        }
    );
  }
}
