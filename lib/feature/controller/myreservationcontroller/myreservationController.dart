import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constats.dart';
import '../../model/reservationmodel.dart';
class MyreservationController extends GetxController{
  var reservationmodel ;
  Getreservation()async{
    int customerid= box.read(customerID);
    Dio dio = Dio();
    final responce = await dio.get("https://hakima-api.birdcloud.qa/BookANurse/GetByCustomer?Customerid=${customerid}");
    reservationmodel = responce.data;
    print(responce.data);
    return responce.data;
  }
}