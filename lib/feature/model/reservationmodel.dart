// To parse this JSON data, do
//
//     final reservationmodel = reservationmodelFromJson(jsonString);

import 'dart:convert';

Reservationmodel reservationmodelFromJson(String str) => Reservationmodel.fromJson(json.decode(str));

String reservationmodelToJson(Reservationmodel data) => json.encode(data.toJson());

class Reservationmodel {
  List<Datum>? data;
  String ?message;
  bool ?success;
  bool ?authorized;

  Reservationmodel({
    this.data,
    this.message,
    this.success,
    this.authorized,
  });

  factory Reservationmodel.fromJson(Map<String, dynamic> json) => Reservationmodel(
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    message: json["Message"],
    success: json["Success"],
    authorized: json["Authorized"],
  );

  Map<String, dynamic> toJson() => {
    "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "Message": message,
    "Success": success,
    "Authorized": authorized,
  };
}

class Datum {
  int ?id;
  String? code;
  String ?contractorType;
  String ?needsCare;
  String ?careServices;
  String ?serviceTime;
  String ?specialInstructions;
  String ?name;
  int ? customerId;
  String ?email;
  String ?phone;
  String ?notes;

  Datum({
    this.id,
    this.code,
    this.contractorType,
    this.needsCare,
    this.careServices,
    this.serviceTime,
    this.specialInstructions,
    this.name,
    this.customerId,
    this.email,
    this.phone,
    this.notes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["ID"],
    code: json["Code"],
    contractorType: json["ContractorType"],
    needsCare: json["NeedsCare"],
    careServices: json["CareServices"],
    serviceTime: json["ServiceTime"],
    specialInstructions: json["SpecialInstructions"],
    name: json["Name"],
    customerId: json["CustomerId"],
    email: json["Email"],
    phone: json["Phone"],
    notes: json["Notes"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Code": code,
    "ContractorType": contractorType,
    "NeedsCare": needsCare,
    "CareServices": careServices,
    "ServiceTime": serviceTime,
    "SpecialInstructions": specialInstructions,
    "Name": name,
    "CustomerId": customerId,
    "Email": email,
    "Phone": phone,
    "Notes": notes,
  };
}
