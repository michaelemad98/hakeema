import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void showToast({required String text,required ToastState state})=> Fluttertoast.showToast(
    msg: "$text",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: choasToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);
enum ToastState{
  SUCCESS,ERROR,WARNING
}
Color choasToastColor(ToastState state){
  Color color;
  switch(state){
    case ToastState.SUCCESS:
      color= Colors.green;
      break;
      case ToastState.ERROR:
        color= Colors.red.shade900;
      break;
      case ToastState.WARNING:
        color = Colors.amber;
      break;
  }
  return color;
}
