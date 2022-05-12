import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:practice/models/CaloriesData.dart';
import 'package:practice/models/User1.dart';
import 'package:practice/services/database.dart';
import 'package:provider/provider.dart';
import 'package:practice/models/User1.dart';
import 'package:practice/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'loading.dart';


class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);


  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final formKey = GlobalKey<FormState>();
  int calories=0;
  String date='';
  int final_calories=0;


  final now = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');


  @override

  Widget build(BuildContext context) {
    User1? user=Provider.of<User1?>(context);

    final String formatted = formatter.format(now);
    //String formatted='5-05-2022';
    Color backcolor=Color(0xff222831);
    Color boxcolor=Color(0xffEEEEEE);




    return StreamBuilder<CaloriesData> (
        stream: DatabaseService(uid: user!.uid).caloriesStream,

        builder: (context, snapshot) {
          print(snapshot);

      if (snapshot.hasData) {
        CaloriesData? caloriesData = snapshot.data;
        int total_calories=caloriesData!.calories;
        print('total calories is below');
        print(total_calories);
        print("WORKING");

        return StreamBuilder<UserData>(
          stream: DatabaseService(uid: user!.uid).usersStream,
          builder: (context, snapshot2) {
          if (snapshot2.hasData) {
            UserData? usersStream = snapshot2.data;
            double usercalories=0;
            try {
              usercalories = double.parse(usersStream!.totalcalorie);
              print(usercalories);
            }catch(e){
              print('catch');
              usercalories=0;
            }

            print("WORKING");

            return Scaffold(
              backgroundColor: backcolor,
              appBar: AppBar(
                title: Text(
                  'Calorie Counter',
                ),
                backgroundColor: Colors.black,
              )
              ,
              body:
              SingleChildScrollView(
                child: Column(

                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: boxcolor,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(20))
                      ),
                      width: 400,
                      height: 140,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.fromLTRB(10, 50, 10, 0),

                      child:

                      Column(
                        children: [
                          Text('Calories Remaining ',

                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          SizedBox(height: 20,),

                          Text(
                            //total_calories.toString(),
                              (usercalories-total_calories).toString(),

                            style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 60,),

                    Container(

                        decoration: BoxDecoration(
                            color: boxcolor,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(20))
                        ),
                        width: 370,
                        height: 261,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.fromLTRB(100, 0, 60, 0),
                        child:
                        Form(
                          key: formKey,
                          child: Column(

                            children: [
                              SizedBox(height: 10,),
                              Text('Enter Calories ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),

                              //calories
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: TextFormField(

                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0),
                                    ),
                                    hintText: 'Enter Calories',
                                    label: Text(
                                      'Calories',
                                    ),
                                  ),

                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      print('wrong');
                                      return 'Please enter some text';

                                    }

                                    setState(() {
                                      calories = int.parse(value);
                                    });

                                    return null;
                                  },



                                ),
                              ),
                              SizedBox(height: 10,),

                              //save button
                              ElevatedButton(
                                  child:
                                  Text('Save'),
                                  onPressed: () async{
                                    if (formKey.currentState!.validate()) {
                                      print(date);
                                      print(calories);
                                      print(total_calories);
                                      setState(() {
                                        final_calories=calories+total_calories;
                                      });
                                      await DatabaseService(uid: user!.uid).addEntry(
                                          user!.uid, formatted, final_calories);
                                    }
                                  }),
                            ],

                          ),
                        )
                    )
                  ],
                ),
              ),
            );
          }
          else{
          return Loading();
          }
          }

        );
          }



      else{
        print(user.uid);

        return Loading();

      }
    }
    );
  }
}
