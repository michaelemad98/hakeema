import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/constant/Toastmessage/compontents.dart';
import 'package:hakeema/feature/model/usermodel.dart';

class RegisgterController extends GetxController{
  TextEditingController nametec= TextEditingController();
  TextEditingController emailtec= TextEditingController();
  TextEditingController phonetec= TextEditingController();

  Future creatUser({required String name,required String email,required String phone,
    required String contractType,
    required String seviceTime,
    required String needCareScreen,
    required String typeCare,
    required String spicallnstructions})async{
    final docUser = FirebaseFirestore.instance.collection('Users').doc();
    final docUseraddress = docUser.collection('address').doc();
    final docUserRequrment = docUser.collection('requirements').doc();
    final json= {
      "Name":name, "Email":email, "Phone":phone
    };
    final jsonaddress={
      "location":"https://goo.gl/maps/BnxbZFh3ZkcTa1av8",
      "address":"El Obour City El Obour City"
    };
    final jsonrequrment={
      "contractType":contractType,
      "seviceTime":seviceTime,
      "needCareScreen":needCareScreen,
      "typeCare":typeCare,
      "spicallnstructions":spicallnstructions
    };
    await docUser.set(json);
    await docUseraddress.set(jsonaddress);
    await docUserRequrment.set(jsonrequrment);
  }
  void send(
      {String ?contractType,
      String ?seviceTime,
      String ?needCareScreen,
      String ?typeCare,
      String ?spicallnstructions})async{
    if(nametec.text.isEmpty||emailtec.text.isEmpty||phonetec.text.isEmpty){
      showToast(text: 'Please Enter data requirements ', state: ToastState.WARNING);
    }
    else{
      final user = UserModel(name: nametec.text.trim(), email: emailtec.text.trim(), phone: phonetec.text.trim());
      creatUser(name:user.name,email:user.email,phone:user.phone,contractType: contractType!,needCareScreen: needCareScreen!,seviceTime: seviceTime!,spicallnstructions: spicallnstructions!, typeCare: typeCare!);
    }
  }

}