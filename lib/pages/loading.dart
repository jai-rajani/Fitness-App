import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  Color backcolor=Color(0xff222831);
  Color boxcolor=Color(0xffEEEEEE);
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.brown[100],
      color: backcolor,
      child: Center(
        child: SpinKitChasingDots(
          //color: Colors.brown,
          color: boxcolor,
          size: 50.0,
        ),
      ),
    );
  }
}