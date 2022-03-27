import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
        'About Us',

      ),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
    body: 
    Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child:
              Column(
                children: [
                  Text('Uchit Mody',
                    style:TextStyle(
                      fontSize: 25.0,
                      ),
                  ),
                  Text(
                    'Roll Number : 16010120030',
                    style:TextStyle(
                      fontSize:20.0,
                    ),
                  ),
                ],
              ),
      ),
        SizedBox(height: 10.0,),
        Card(
          child:
           Column(
               children: [
                  Text(
                    'Rahil Parikh',
                    style:TextStyle(
                    fontSize: 26.0,
                    ),
                  ),
                 Text(
                   'Roll Number : 16010120037',
                   style:TextStyle(
                     fontSize:20.0,
                   ),
                 ),
          ],
        ),
      ),
          SizedBox(height: 10.0,),
      Card(
        
      child:
        Column(
          children: [
            Text(
              'Jai Rajani',
              style:TextStyle(
                fontSize: 26.0,
                ),
            ),
            Text(
              'Roll Number : 16010120041',
              style:TextStyle(
                fontSize:20.0,
              ),
            ),
          ],
        ),
          ),
          SizedBox(height: 10.0,),
          Text(
            'Fitness App is an app fcused on burning calories and etc etc etc ebcidbcnvcnvc\n idhiwvcruiv c\n hiwehcuwchrv8 rv\nryryhcirwrucnerwoiv ewvewvw',
            style:TextStyle(
              fontSize: 22.0,
            )
          ),
        ],
        ),
    ),
    );
  }
}
