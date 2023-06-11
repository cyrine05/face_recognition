import 'package:intl/intl.dart';

class UserModel {
  String? id;
  String? lastName;
  String? firstName;
  String? email;
  String? birthDate;
  String? adress;
  int? cin;
  int? phoneNumber1;
  int? phoneNumber2;
  String? image;
  String? password;
  int? nbConge;
  String? situation;
  String? sexe;
  int? nbEnfants;

  String? startTime;
  String? endTime;
  String? deviceToken;
  String? resetToken;
  String? resetTokenExpiration;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.birthDate,
    this.adress,
    this.cin,
    this.phoneNumber1,
    this.phoneNumber2,
    this.image,
    this.nbConge,
    this.situation,
    this.sexe,
    this.nbEnfants,
    this.startTime,
    this.endTime,
    this.deviceToken,
  });

  UserModel.fromJson(Map<String?, dynamic> json) {
    this.id = json['id'];
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.birthDate = json['birthDate'];
    this.adress = json['adress'];
    this.phoneNumber1 = json['phoneNumber1'];
    this.phoneNumber2 = json['phoneNumber2'];
    this.image = json['image'];
    this.nbConge = json['nbConge'];
    this.situation = json['situation'];
    this.sexe = json['sexe'];
    this.nbEnfants = json['nbEnfants'];
    this.startTime = json['startTime'];
    this.endTime = json['endTime'];
    this.deviceToken = json['deviceToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['birthDate'] = this.birthDate;
    data['adress'] = this.adress;
    data['phoneNumber1'] = this.phoneNumber1;
    data['phoneNumber2'] = this.phoneNumber2;
    data['image'] = this.image;
    data['situation'] = this.situation;
    data['sexe'] = this.sexe;
    data['nbEnfants'] = this.nbEnfants;
    data['deviceToken'] = this.deviceToken;
    return data;
  }
}
