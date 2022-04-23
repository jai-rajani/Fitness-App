class User1{
  final  String uid;
  User1({required this.uid});
}
class UserData{
  final String? uid;
  final String name;
  final int height;
  final int weight;
  final int age;
  final String activity;
  final String goal;
  final String bmi;
  final String tdee;
  final String totalcalorie;

  //CONSTRUCTOR
  UserData({
    this.uid,
    required this.name,
    required this.height,
    required this.weight,
    required this.age,
    required this.activity,
    required this.goal,
    required this.bmi,
    required this.tdee,
    required this.totalcalorie,
  });
}
