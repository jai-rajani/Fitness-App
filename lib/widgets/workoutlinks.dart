import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/User1.dart';

class Workoutlinks extends StatelessWidget {

  String data="";
  String type="";
  Workoutlinks({required this.type,required this.data});

  @override
  Widget build(BuildContext context) {
     void _launchURL() async {
      final Uri _url = Uri.parse(data);
      if (await canLaunchUrl(_url)) {
        await launchUrl(_url);
      } else {
        throw 'Could not launch $_url';
      }
    }
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
      width: 500,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),

      child:

      Column(
        children: [
          Text(type,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          TextButton(

            onPressed: () async{
              _launchURL();

            },
            child: Text("Click Here",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                )),

          ),


        ],
      ),
    );

  }
}
