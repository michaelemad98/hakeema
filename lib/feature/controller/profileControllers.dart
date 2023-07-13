
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/constant/Toastmessage/compontents.dart';
import 'package:hakeema/feature/controller/registercontroller.dart';
import 'package:hakeema/feature/controller/userRepository.dart';

import '../constant/constats.dart';
import '../repository/userrepository/user_repository.dart';
class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  // final _authRepo = Get.put(RegisgterController());
  final _auth =FirebaseAuth.instance;
  Rx<User?>? firebaseUser;
  var verificationId= ''.obs;
  var userCredential;
  var user;
  var uid;
  final _useRepo= Get.put(UserRepository());
  getUserData(){
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser!.bindStream(_auth.userChanges());
    final phone = firebaseUser!.value!.phoneNumber;
    print(phone);
    if(phone !=null){
     return _useRepo.getUserDetails(phone);
    }else{
      showToast(text: 'Login To continue', state: ToastState.ERROR);
    }
    }
    bool isCompleted = false;
  var data ;

  getCustomerInfo()async{
    int customerid= box.read(customerID);
    Dio dio = Dio();
    final responce = await dio.get('${Url_api}/Customer/Get/${customerid}');
    print(responce.data);
    if(responce.data['Data']['IsCompleted']==true){
      isCompleted = true;
      update();
      data = responce.data;
    }else{
      isCompleted = false;
      update();
    }
    return responce.data;
  }
  language(){
    update();
  }
}

