import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String firebaseUser;

  UserModel(
      {
        this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.firebaseUser
      });

  toJson(){
    return {
      "Name":name,
      "Email":email,
      "Phone":phone,
      "firebaseUser":firebaseUser
    };
  }
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>>document){
    final data= document.data();
    return UserModel(
        id:document.id ,
        name: data!["Name"], email: data!["Email"], phone: data["Phone"],firebaseUser: data["firebaseUser"]);
  }
}
