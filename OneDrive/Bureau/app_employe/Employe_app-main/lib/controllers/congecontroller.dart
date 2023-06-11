import 'dart:io';

import 'package:app_employe/home.dart';
import 'package:app_employe/service/congeservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '../models/conge.dart';
import 'UserController.dart';

class CongeController extends GetxController {
  Rx<CongeModel> _CongeModel = CongeModel().obs;
  var conges = <CongeModel>[].obs;
  CongeModel get conge => _CongeModel.value;
  final UserController Usercontroller = Get.put(UserController());

  set user(CongeModel value) => this._CongeModel.value = value;

  void clear() {
    _CongeModel.value = CongeModel();
  }

  @override
  onInit() {
    getData();
    super.onInit();
  }

  void sendData(CongeModel conge) {
    CongeService.addConge(
            Get.find<UserController>().token.toString(), conge.toJson())
        .then((response) async {
      if (response.statusCode == 201) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        conge = CongeModel.fromJson(responseData);
        await Get.defaultDialog(
            title: "succes",
            middleText: "your request has been successfully sent!");

        getData();
      } else {
        Get.defaultDialog(
            title: "error", middleText: "Failed  to send your request");
        throw Exception('Failed  to send your request' + response.body);
      }
    });
  }

  Future<void> getData() async {
    await CongeService.get(Get.find<UserController>().token.toString(),
            Usercontroller.user.id!)
        .then((response) async {
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        conges.value = jsonResponse
            .map((congeJson) => CongeModel.fromJson(congeJson))
            .toList();

        print(conges.value.toList());
        print("it works");
      } else {
        throw Exception('Failed to get data');
      }
      update();
    });
  }
}
