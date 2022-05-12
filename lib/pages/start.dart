import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:practice/models/User1.dart';
import 'package:practice/pages/loading.dart';
import 'package:practice/pages/profile.dart';
import 'package:practice/pages/counter.dart';
import 'package:practice/pages/workout.dart';
import 'package:practice/services/database.dart';
import 'package:provider/provider.dart';

class  Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => start_State();
}

class start_State extends State<Start> {
  //bool value = false;
  Color backcolor=Color(0xff222831);
  Color boxcolor=Color(0xffEEEEEE);

  int val = -1;
  int height=0;
  int weight=0;
  String dropdownValue = 'sedentary active';
  String dropdownValue2 = 'lose weight';
  double bmi_calc(){
    return weight/(pow(height/100, 2));
  }
  String bmiScale() {
    if (bmi_calc() < 18.5)
      return 'UNDERWEIGHT';
    else if (bmi_calc() >= 18.5 && bmi_calc() <= 24.9)
      return 'NORMAL';
    else if (bmi_calc() >= 25 && bmi_calc() <= 29.9)
      return 'OVERWEIGHT';
    else if (bmi_calc() >= 30 && bmi_calc() <= 34.9)
      return 'OBESE';
    else if (bmi_calc() >= 35)
      return 'EXTREMLY OBESE';
    else
      return 'BMI';
  }
  String bmi='';
  String bmiscale='';
  bool flag=true;
  int age=18;
  double bmr() {
    if (flag == true) {
      return (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      return (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
  }

  double tdee() {
    if (dropdownValue == 'sedentary active')
      return bmr() * 1.2;
    else if (dropdownValue == 'lightly active')
      return bmr() * 1.375;
    else if (dropdownValue == 'moderately active')
      return bmr() * 1.55;
    else if (dropdownValue == 'very active')
      return bmr() * 1.725;
    else if (dropdownValue == 'extremly active')
      return bmr() * 1.9;
    else
      return 0;
  }

  double totalCalories() {
    if (dropdownValue2 == 'lose weight') {
      return (tdee() - 500);
    } else if (dropdownValue2 == 'maintain weight') {
      return tdee();
    } else if (dropdownValue2 == 'gain weight') {
      return tdee() + 400;
    } else
      return 0;
  }
  String totalcalories='';
  String s_bmr='';
  String s_tdee='';




  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    User1? user=Provider.of<User1?>(context);
    return StreamBuilder<UserData>(

      stream: DatabaseService(uid: user!.uid).usersStream,

      builder: (context, snapshot) {
        print(snapshot);

        if (snapshot.hasData) {
          UserData? usersStream = snapshot.data;
          print("WORKING");


          return Scaffold(
            //backgroundColor: Colors.cyan,
            backgroundColor: backcolor,

            appBar: AppBar(


              backgroundColor: Colors.black,
              actions: <Widget>[
                TextButton(

                  onPressed: () async{

                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Counter())
                    );


                  },
                  child: Text("Start",
                      style:TextStyle(
                        fontSize: 17,
                        color:Colors.white,
                      )),

                ),
                TextButton(

                  onPressed: () {
                    Navigator.pushNamed(context, '/aboutus');
                  },
                  child: Text("About Us",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      )),

                ),


                TextButton(

                  onPressed: () async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Workout()));
                  },
                  child: Text("Workouts",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      )),

                ),
                TextButton(

                  onPressed: () async{

                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile())
                    );


                  },
                  child: Text("Profile",
                      style:TextStyle(
                        fontSize: 17,
                        color:Colors.white,
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
                    margin: EdgeInsets.fromLTRB(80, 30, 0, 0),
                    child: Row(

                      children: [
                        SizedBox(
                          height: 40,
                          width: 120,
                          child:
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                flag = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                primary: flag ? Colors.blue : Colors.grey,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                            child:
                            Text(
                              'Male',
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        SizedBox(
                          height: 40,
                          width: 120,
                          child:
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                flag = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                primary: flag ? Colors.grey : Colors.pink,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                textStyle: TextStyle(
                                    fontSize: 30,

                                    fontWeight: FontWeight.bold)),
                            child:
                            Text(
                              'Female',
                            ),

                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Form(
                    key: formKey,
                    child: Container(
                      decoration: BoxDecoration(
                          color: boxcolor,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      width: 5000,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),


                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,


                        children: [
                          Text(
                              'Enter Height and Weight',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,

                              )
                          ),
                          SizedBox(height: 30,),
                          Container(
                            padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                            child: Row(

                              children: [
                                Container(

                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),

                                  width: 110,
                                  height: 50,
                                  child: TextFormField(

                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        final number = num.tryParse(value);

                                        if (number == null) {
                                          return 'numeric values only';
                                        }
                                        setState(() {
                                          height = int.parse(value);
                                        });
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0),
                                        ),
                                        hintText: 'Enter Height',
                                        label: Text(
                                          'Height(cm)',
                                        ),
                                      )
                                  ),
                                ),
                                SizedBox(height: 0, width: 40,),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  height: 50,
                                  width: 110,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                      ),
                                      hintText: 'Enter Weight',
                                      label: Text(
                                        'Weight(kg)',
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      final number = num.tryParse(value);

                                      if (number == null) {
                                        return 'numeric values only';
                                      }
                                      setState(() {
                                        weight = int.parse(value);
                                      });
                                      return null;
                                    },

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),

                  Container(

                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    margin: EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(
                        color: boxcolor,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Enter Age',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )
                        ),
                        Center(
                          child: NumberPicker(
                            value: age,
                            minValue: 12,
                            maxValue: 80,
                            onChanged: (value) => setState(() => age = value),
                            selectedTextStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            axis: Axis.horizontal,
                            itemCount: 7,
                            itemWidth: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    height: 200,
                    decoration: BoxDecoration(
                        color: boxcolor,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    width: 5000,

                    margin: EdgeInsets.all(10),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Activity Level',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )
                        ),
                        //Drop(key: _myKey),
                        Container(


                          child: DropdownButton<String>(
                            dropdownColor: boxcolor,

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
                            items: <String>[
                              'sedentary active',
                              'lightly active',
                              'moderately active',
                              'very active',
                              'extremely active'
                            ]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(height: 20,),
                        Text('Fitness Goal',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        Container(
                          child: DropdownButton<String>(
                            dropdownColor: boxcolor,
                            value: dropdownValue2,
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
                                dropdownValue2 = newValue!;
                              });
                            },
                            items: <String>[
                              'lose weight',
                              'maintain weight',
                              'gain weight'
                            ]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 30,),

                  //BUTTON

                  Container(
                    margin: EdgeInsets.fromLTRB(160, 0, 0, 0),
                    child:
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            textStyle: TextStyle(
                                fontSize: 30,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {

                              bmi=bmi_calc().toStringAsFixed(2);
                              bmiscale=bmiScale();
                              s_bmr=bmr().toString();
                              s_tdee=tdee().toString();
                              totalcalories=totalCalories().toString();

                            });
                            print(user.uid);
                            print(height);
                            print(weight);
                            await DatabaseService(uid: user.uid).updateUserData(
                              usersStream!.name,
                              height ,
                              weight ,
                              age,
                              dropdownValue,
                              dropdownValue2,
                              bmi,
                              s_tdee,
                              totalcalories,
                            );
                          }
                        },
                        /*onPressed: () {
                          if (formKey.currentState!.validate()) {


                            setState(() {

                              bmi=bmi_calc().toStringAsFixed(2);
                              bmiscale=bmiScale();
                              s_bmr=bmr().toString();
                              s_tdee=tdee().toString();
                              totalcalories=totalCalories().toString();

                            });


                          }
                        },*/
                        child: Text(
                          'Save',

                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60,),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: boxcolor,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        width: 5000,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),

                        child:

                        Column(
                          children: [
                            Text('Your Total Calorie Intake is \n',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),

                            Text(totalcalories,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,),
                            ),

                          ],
                        ),
                      ),
                      Row(
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
                            width: 170,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),

                            child:

                            Column(
                              children: [
                                Text('Your TDEE is ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),

                                Text(s_tdee,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: boxcolor,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20))
                            ),
                            width: 170,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),

                            child:

                            Column(
                              children: [
                                Text('Your BMI is ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),

                                Text(bmi,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,),
                                ),

                              ],
                            ),
                          ),

                        ],
                      )


                    ],

                  ),
                ],
              ),
            ),


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





