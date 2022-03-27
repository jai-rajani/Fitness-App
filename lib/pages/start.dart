import 'dart:math';
import 'package:flutter/material.dart';
import 'package:practice/widgets/drop.dart';
import 'package:practice/widgets/drop2.dart';
import 'package:hive/hive.dart';
import 'package:practice/pages/result.dart';

class  Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => start_State();
}

class start_State extends State<Start> {
  bool value = false;
  int val = -1;
  int height=0;
  int weight=0;
  double bmi_calc(){
    return weight/(pow(height/100, 2));
  }
  String bmi='';



  GlobalKey<Dropd> _myKey = GlobalKey();
  GlobalKey<Dropd2> _myKey2 = GlobalKey();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              ListTile(
                title: Text("Male"),
                leading: Radio(
                  value: 1,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {


                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: Text("Female"),
                leading: Radio(
                  value: 2,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {

                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              SizedBox(height: 20,),
              Form(
                key:formKey,
                child: Column(

                  children: [

                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    width: 130,
                    height: 100,
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
                        height=int.parse(value);
                      });
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Height',
                      label: Text(
                        'Height',
                      ),
                    )
                    ),
                  ),
                  SizedBox(height: 0,),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 0, 10),
                    height: 100,
                    width:130,
                    child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Weight',
                      label: Text(
                        'Weight',
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
                      weight=int.parse(value);
                    });
                    return null;
                },

              ),
                  ),
              ],
                ),
              ),

              SizedBox(height: 30,),

              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child:
                Column(
                  children: [
                    Text('Activity Level '),
                    Drop(key: _myKey),
                    SizedBox(height: 20,),
                    Text('Fitness Goal'),
                    Drop2(key: _myKey2),
                  ],
                ),
              ),
            SizedBox(height: 20,),
            Container(
              child:
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print("done");
                        double xyz =bmi_calc();
                        print(xyz);
                        setState(() {

                          bmi=bmi_calc().toString();
                        });


                      }
                    },
                    child: Text('Save',),
                  ),
                ),
            ),
           Center(
             child: Text(
                 'Your BMI is '+bmi+'!',
                  style:TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
           ),

            ],
          ),
      ),


    );
  }
}



