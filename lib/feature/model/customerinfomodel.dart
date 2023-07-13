
import 'dart:convert';

Customerinfomodel customerinfomodelFromJson(String str) => Customerinfomodel.fromJson(json.decode(str));

String customerinfomodelToJson(Customerinfomodel data) => json.encode(data.toJson());

class Customerinfomodel {
  Data ?data;
  String? message;
  bool? success;
  bool ?authorized;

  Customerinfomodel({
    this.data,
    this.message,
    this.success,
    this.authorized,
  });

  factory Customerinfomodel.fromJson(Map<String, dynamic> json) => Customerinfomodel(
    data: Data.fromJson(jsonDecode(json["Data"])),
    message: json["Message"],
    success: json["Success"],
    authorized: json["Authorized"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data!.toJson(),
    "Message": message,
    "Success": success,
    "Authorized": authorized,
  };
}

class Data {
  int ?id;
  String ?code;
  String ?mobile;
  String ?email;
  String ?photo;
  String ?uid;
  String ?firstNameArabic;
  String? firstNameEnglish;
  String ?address;
  String ?address2;
  bool ?isCompleted;
  String? playerId;
  String ?zoneNo;
  String? streetName;
  String ?locationgps;
  String? buildingNumber;
  String ?unitNumber;
  String? validationCode;
  String ?accessToken;
  String ?normalizedCode;
  String ?familyNameArabic;
  String ?fullNameArabic;
  String? familyNameEnglish;
  String? fullNameEnglish;
  String ?phone;
  String? dateOfBirth;
  String ?password;
  String ?genderId;
  String ?customerAddresses;

  Data({
    this.id,
    this.code,
    this.mobile,
    this.email,
    this.photo,
    this.uid,
    this.firstNameArabic,
    this.firstNameEnglish,
    this.address,
    this.address2,
    this.isCompleted,
    this.playerId,
    this.zoneNo,
    this.streetName,
    this.locationgps,
    this.buildingNumber,
    this.unitNumber,
    this.validationCode,
    this.accessToken,
    this.normalizedCode,
    this.familyNameArabic,
    this.fullNameArabic,
    this.familyNameEnglish,
    this.fullNameEnglish,
    this.phone,
    this.dateOfBirth,
    this.password,
    this.genderId,
    this.customerAddresses,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["ID"],
    code: json["Code"],
    mobile: json["Mobile"],
    email: json["Email"],
    photo: json["Photo"],
    uid: json["UID"],
    firstNameArabic: json["FirstNameArabic"],
    firstNameEnglish: json["FirstNameEnglish"],
    address: json["Address"],
    address2: json["Address2"],
    isCompleted: json["IsCompleted"],
    playerId: json["PlayerId"],
    zoneNo: json["ZoneNO"],
    streetName: json["StreetName"],
    locationgps: json["locationgps"],
    buildingNumber: json["BuildingNumber"],
    unitNumber: json["UnitNumber"],
    validationCode: json["ValidationCode"],
    accessToken: json["AccessToken"],
    normalizedCode: json["NormalizedCode"],
    familyNameArabic: json["FamilyNameArabic"],
    fullNameArabic: json["FullNameArabic"],
    familyNameEnglish: json["FamilyNameEnglish"],
    fullNameEnglish: json["FullNameEnglish"],
    phone: json["Phone"],
    dateOfBirth: json["DateOfBirth"],
    password: json["Password"],
    genderId: json["GenderID"],
    customerAddresses: json["CustomerAddresses"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Code": code,
    "Mobile": mobile,
    "Email": email,
    "Photo": photo,
    "UID": uid,
    "FirstNameArabic": firstNameArabic,
    "FirstNameEnglish": firstNameEnglish,
    "Address": address,
    "Address2": address2,
    "IsCompleted": isCompleted,
    "PlayerId": playerId,
    "ZoneNO": zoneNo,
    "StreetName": streetName,
    "locationgps": locationgps,
    "BuildingNumber": buildingNumber,
    "UnitNumber": unitNumber,
    "ValidationCode": validationCode,
    "AccessToken": accessToken,
    "NormalizedCode": normalizedCode,
    "FamilyNameArabic": familyNameArabic,
    "FullNameArabic": fullNameArabic,
    "FamilyNameEnglish": familyNameEnglish,
    "FullNameEnglish": fullNameEnglish,
    "Phone": phone,
    "DateOfBirth": dateOfBirth,
    "Password": password,
    "GenderID": genderId,
    "CustomerAddresses": customerAddresses,
  };
}
