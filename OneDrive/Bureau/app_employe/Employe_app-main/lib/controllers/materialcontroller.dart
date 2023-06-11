import 'dart:io';

import 'package:app_employe/home.dart';
import 'package:app_employe/service/congeservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '../list_material.dart';
import '../models/conge.dart';
import '../models/material.dart';
import '../service/materialservice.dart';
import 'UserController.dart';

class MaterialController extends GetxController {
  Rx<MaterialModel> _MaterialModel = MaterialModel().obs;
  var material = <MaterialModel>[].obs;
  MaterialModel get mat => _MaterialModel.value;
  final UserController Usercontroller = Get.put(UserController());

  set mat(MaterialModel value) => this._MaterialModel.value = value;

  void clear() {
    _MaterialModel.value = MaterialModel();
  }

  @override
  onInit() {
    getData();
    super.onInit();
  }

  void sendData(MaterialModel material) {
    MaterialService.addMaterial(
            Get.find<UserController>().token.toString(), material.toJson())
        .then((response) async {
      if (response.statusCode == 201) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        material = MaterialModel.fromJson(responseData);
        await Get.defaultDialog(
            title: "succes",
            middleText: "your request has been successfully sent!");
        getData();
        Get.to(ListMaterial());
      } else {
        Get.defaultDialog(
            title: "error", middleText: "Failed  to send your request");
        throw Exception('Failed  to send your request' + response.body);
      }
    });
  }

  Future<void> getData() async {
    await MaterialService.get(Get.find<UserController>().token.toString(),
            Usercontroller.user.id!)
        .then((response) async {
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        material.value = jsonResponse
            .map((materialJson) => MaterialModel.fromJson(materialJson))
            .toList();

        print(material.value.toList());
        print("it works");
      } else {
        throw Exception('Failed to get data');
      }
      update();
    });
  }
}
