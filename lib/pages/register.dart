import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice/pages/loading.dart';
import 'package:practice/services/authentication.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isloading=false;
  final AuthService _auth=AuthService();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String Error='';
  @override

  Widget build(BuildContext context) {

    return
      isloading? Loading():Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            title: Text('Fitness Tracker'),
            centerTitle: true,
            backgroundColor: Colors.grey[850],
            elevation: 0.0,
          ),
          body: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(

                      'Create Account ',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    ),
                  ),

                  //Sign in Form

                  Form(
                    key:formKey,
                    child:Column(
                      children:<Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            style: TextStyle(
                              color:Colors.white,
                            ),
                            controller: usernameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelText: 'User Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            style: TextStyle(
                              color:Colors.white,
                            ),
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            style:TextStyle(
                              color:Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }


                              if (value.length<6) {
                                return 'Password should be greater than 6';
                              }

                              return null;
                            },
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelText: 'Password',
                            ),
                          ),
                        ),

                        SizedBox(height: 50,),




                        //REGISTER BUTTON
                        Container(
                            height: 50,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              // textColor: Colors.white,
                              // color: Colors.blue,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white,
                                ),
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      isloading=true;
                                    });
                                    dynamic result=await _auth.registerEmail(usernameController.text,nameController.text,passwordController.text);
                                    if(result==null){
                                      setState(() {
                                        Error='Enter a Valid Email Address!!';
                                      });
                                    }
                                    else{
                                      Navigator.pop(context);
                                      print("no error");
                                    }
                                  }

                                }
                            )
                        ),
                        /*

                        //SIGN IN WITH EMAIL
                        Container(
                            height: 50,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              // textColor: Colors.white,
                              // color: Colors.blue,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white,
                                ),
                                child: Text(
                                  'Login with Email',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    dynamic result=await _auth.signEmail(nameController.text,passwordController.text);
                                    if(result==null){
                                      print("WRONG ID");
                                      setState(() {
                                        Error='Incorrect email and password';
                                      });
                                    }
                                    else{
                                      print("no error");
                                    }
                                  }

                                }
                            )
                        ),
                        Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Does not have account?',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    primary: Colors.blue,
                                  ),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )
                        ),

                         */

                        //ERROR
                        Container(
                            child:Text(
                              Error,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                        )

                      ],
                    ),
                  ),
                ],
              )
          )
      );
  }
}