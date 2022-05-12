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

class Details extends StatelessWidget {

  String data="";
  String type="";
  Details({required this.type,required this.data});

  @override
  Widget build(BuildContext context) {
    Color backcolor = Color(0xff222831);
    Color boxcolor = Color(0xffEEEEEE);
    return Container(
      decoration: BoxDecoration(
          color: boxcolor,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(20))
      ),
      width: 175,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),

      child:

      Column(
        children: [
          Text('Your '+type+' is ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),

          Text(data,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.red,),
          ),

        ],
      ),
    );

  }
}
