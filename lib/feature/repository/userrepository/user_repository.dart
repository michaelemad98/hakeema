import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/model/usermodel.dart';
class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();
  final _db   = FirebaseFirestore.instance;
  createUser(UserModel user)async{
    await _db.collection("Users").add(user.toJson()).whenComplete(() => Get.snackbar("Sucess", "You account has been created.",
    snackPosition: SnackPosition.BOTTOM,

    )).catchError((error,stackTrace){
      Get.snackbar("Erorr", "something went wrong, try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  Future<UserModel> getUserDetails(String phone)async{
    print('phone = > ${phone}');
    final snapshot = await _db.collection("Users").where("Phone", isEqualTo:phone).get();
    print (snapshot.docs.length);
    final userData= snapshot.docs.map((e)=> UserModel.fromSnapshot(e)).single;
    return userData;
  }
}