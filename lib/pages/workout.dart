import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/workoutlinks.dart';

class Workout extends StatelessWidget {
  const Workout({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    Color backcolor = Color(0xff222831);
    Color boxcolor = Color(0xffEEEEEE);
    return Scaffold(
        backgroundColor: backcolor,
      appBar: AppBar(

        title: Text('Fitness App'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
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
        ],
      ),
      body:SingleChildScrollView(

        child:
        Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.fromLTRB(80, 20, 0, 20),
              child: Text('Workout Guides',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  )),
            ),
            Workoutlinks(type: "30-Minute HIIT Cardio Workout with Warm Up - No Equipment at Home | SELF", data: "https://youtu.be/ml6cT4AZdqI"),
            Workoutlinks(type: "Do This Everyday To Lose Weight | 2 Weeks Shred Challenge", data: "https://youtu.be/2MoGxae-zyo"),
            Workoutlinks(type: "20 MINUTE FULL BODY WORKOUT(NO EQUIPMENT)", data: "https://youtu.be/oAPCPjnU1wA"),
            Workoutlinks(type: "COMPLETE 20 MIN ABS WORKOUT (From Home)", data: "https://youtu.be/8PwoytUU06g"),
            Workoutlinks(type: "How To Unlock Your Push Up Strength (In 5 Minutes)", data: "https://youtu.be/Z88Rl5bpnmI"),
            Workoutlinks(type: "Day 1 | 30 Minute at Home Strength Workout | Clutch Life: Ashley Conrad's 24/7 Fitness Trainer", data: "https://youtu.be/YdB1HMCldJY"),
            Workoutlinks(type: "90 MIN | Cardio Aerobic & Full Body Workout for better Strength & Endurance", data: "https://youtu.be/bf_QfdU2jZ4"),
            Workoutlinks(type: "10 MINUTE FAT BURNING MORNING ROUTINE | Do this every day | Rowan Row", data: "https://youtu.be/7KSNmziMqog"),
            Workoutlinks(type: "Killer 10 Minute Fat Burning Bodyweight Workout", data: "https://youtu.be/_knIf9vF4k4"),
            Workoutlinks(type: "20 Minute Total Body Tabata Workout (NO EQUIPMENT)", data: "https://youtu.be/D7oV4wXMUws"),




          ],
        ),
      ),
        

    );
  }
}
