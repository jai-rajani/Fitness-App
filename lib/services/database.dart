import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:practice/models/CaloriesData.dart';
import 'package:practice/models/User1.dart';

import 'package:intl/intl.dart';

class DatabaseService{
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('User');
  final CollectionReference testCollection = FirebaseFirestore.instance.collection('test');


  //UPDATE USER
  Future updateUserData(String name,int height,int weight,int age,String activity,String goal,String bmi,String tdee,String totalcalorie) async{
    return await usersCollection.doc(uid).set(
      {
        'name':name,
        'height':height,
        'weight':weight,
        'age':age,
        'activity':activity,
        'goal':goal,
        'bmi':bmi,
        'tdee':tdee,
        'totalcalorie':totalcalorie,

      }
    );
}
  //User Data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
        uid: uid,
        name: snapshot['name'],
        height: snapshot['height'],
        weight: snapshot['weight'],
        age: snapshot['age'],
        activity: snapshot['activity'],
        goal: snapshot['goal'],
        bmi: snapshot['bmi'],
        tdee: snapshot['tdee'],
        totalcalorie: snapshot['totalcalorie'],



    );
  }

  CaloriesData _calorieDataFromSnapshot(DocumentSnapshot snapshot){
    return CaloriesData(
      date:snapshot['date'],
      calories: snapshot['calories'],
    );
  }
  Stream<CaloriesData> get caloriesStream{
    final String formatted = formatter.format(DateTime.now());
    //final String formatted ='5-05-2022';
    return testCollection.doc(uid).collection('nwstedTest').doc(formatted).snapshots()
        .map(_calorieDataFromSnapshot);

  }

 //get user doc streams
  Stream<UserData> get usersStream{
    return usersCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);

  }

  /*List<CaloriesData> _caloriesListfromsnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return CaloriesData(
        date: doc.data['date'],
        calories: doc.data['calories']
      )
    })
  }*/

  //add subcollection
  Future addCollection(String? number) async{

    print('running');
    final String formatted = formatter.format(DateTime.now());


    return await testCollection.doc(number).collection('nwstedTest').doc(formatted).set(
        {
          'date': formatted,
          'calories':0,
        });

  }

  //add data to calories document
  Future addEntry(String? number,String date,int calories) async{
    print('running');
    final CollectionReference testCollection = FirebaseFirestore.instance.collection('test');

    return await testCollection.doc(number).collection('nwstedTest').doc(date).set(
        {
          'date':date,
          'calories':calories,
        });

  }
}