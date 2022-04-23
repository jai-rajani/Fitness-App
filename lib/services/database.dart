



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:practice/models/User1.dart';
class DatabaseService{
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('User');


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

 //get user doc streams
  Stream<UserData> get usersStream{
    return usersCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);

  }

  Future addCollection(String? number) async{
    print('running');
    final CollectionReference testCollection = FirebaseFirestore.instance.collection('test');

    return await testCollection.doc(number).collection('nwstedTest').add(
        {
          'id': number,
        });
  }
}