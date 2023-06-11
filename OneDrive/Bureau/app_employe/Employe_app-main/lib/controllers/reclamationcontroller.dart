import 'dart:convert';

import 'package:get/get.dart';

import '../models/reclamation.dart';
import '../service/reclamationservice.dart';
import 'UserController.dart';

class ReclamationController extends GetxController {
  final UserController Usercontroller = Get.put(UserController());
  Rx<ReclamationModel> _ReclamationModel = ReclamationModel().obs;
  var reclamations = <ReclamationModel>[].obs;
  ReclamationModel get reclamation => _ReclamationModel.value;

  set reclamation(ReclamationModel value) =>
      this._ReclamationModel.value = value;

  void clear() {
    _ReclamationModel.value = ReclamationModel();
  }

  void sendData(ReclamationModel reclamation) {
    ReclamationService.sendReclamation(
            Get.find<UserController>().token.toString(), reclamation.toJson())
        .then((response) async {
      if (response.statusCode == 201) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        reclamation = ReclamationModel.fromJson(responseData);
        Get.defaultDialog(
            title: "succes",
            middleText: "your request has been successfully sent!");
      } else {
        Get.defaultDialog(
            title: "error", middleText: "Failed  to send your request");
        throw Exception('Failed  to send your request' + response.body);
      }
    });
  }
}
