import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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