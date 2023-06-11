import 'dart:io';

import 'package:app_employe/home.dart';
import 'package:app_employe/service/congeservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '../models/conge.dart';
import '../models/notif.dart';
import '../service/notifservice.dart';
import 'UserController.dart';

class NotifController extends GetxController {
  Rx<NotifModel> _NotifModel = NotifModel().obs;
  var Notifs = <NotifModel>[].obs;
  NotifModel get Notif => _NotifModel.value;
  final UserController Usercontroller = Get.put(UserController());

  set user(NotifModel value) => this._NotifModel.value = value;

  void clear() {
    _NotifModel.value = NotifModel();
  }

  @override
  onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    print(Usercontroller.user.deviceToken!);
    String device = Usercontroller.user.deviceToken!.replaceAll('"', '');
    await NotifService.get(device).then((response) async {
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        Notifs.value = jsonResponse
            .map((NotifJson) => NotifModel.fromJson(NotifJson))
            .toList();
        print(Notifs.value.toList());
        print("it works");
      } else {
        throw Exception('Failed to get data');
      }
      update();
    });
  }
}
