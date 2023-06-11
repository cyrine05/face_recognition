import 'dart:io';

import 'package:app_employe/home.dart';
import 'package:app_employe/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '../models/user.dart';
import '../overview.dart';
import '../service/userservice.dart';
import 'congecontroller.dart';
import 'materialcontroller.dart';
import 'notifcontroller.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;
  late String? token;
  late String? deviceToken;

  void clear() {
    _userModel.value = UserModel();
  }

  final storage = FlutterSecureStorage();

  @override
  onInit() {
    super.onInit();
    requestPermission();
    getToken();
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request permission to receive notifications
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user granted permission ");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("user granted provisinal permission ");
    } else {
      print("user denied permission ");
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) async {
      deviceToken = token!;
      print("my token is $deviceToken");
    });
  }

  void login(String email, String password) async {
    print(deviceToken);
    UserService.login(
      email,
      password,
    ).then((response) async {
      dynamic responseData = jsonDecode(response.body);
      print(responseData['msg']);
      if (responseData['msg'] != 'Logged In') {
        Get.snackbar(
          "Error signing in",
          responseData['msg'].toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        token = responseData['token'];
        print(token);
        await storage.write(key: 'token', value: token);
        print(responseData['id']);
        await setDeviceToken(responseData['id']);
        await getData(responseData['id']);
        Get.off(Home());
      }
    });
  }

  getData(String id) async {
    await UserService.get(token!, id).then((response) async {
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        user = UserModel.fromJson(responseData);
        print("this is a new user");
        print(user.toString());
      } else {
        throw Exception('Failed to fetch user');
      }
    });
  }

  setDeviceToken(String id) async {
    await UserService.saveDeviceToken(token!, id, deviceToken!)
        .then((response) async {
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        throw Exception('Failed to save device token');
      }
    });
  }

  changePassword(String id, String password, String newpassword) async {
    await UserService.changePassword(token!, id, password, newpassword)
        .then((response) async {
      print(response.body);
      if (response.statusCode == 200) {
        Get.defaultDialog(
            title: "succes",
            middleText: "your password been successfully changed!");
        getData(id);
      } else {
        Get.defaultDialog(
            title: "error", middleText: "Failed change your password");
        throw Exception('Failed  to send your request' + response.body);
      }
    });
  }

  uploadfile(File file) async {
    UserService userService = UserService();
    try {
      var response = await userService.uploadFile(token!, file);
      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        throw Exception('Failed to upload file: ' + response.body);
      }
    } catch (e) {
      throw Exception('Failed to upload file: ' + e.toString());
    }
  }

  void updateData(String id, UserModel user) {
    UserService.updateEmploye(token!, id, user.toJson()).then((response) async {
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        user = UserModel.fromJson(responseData);
        Get.defaultDialog(
            title: "succes",
            middleText: "your data has been successfully updated!");
        update();
        getData(id);
      } else {
        Get.defaultDialog(
            title: "error", middleText: "failed to update your data");
        throw Exception('Failed  update data' + response.body);
      }
    });
  }

  logout() {
    UserService.logout(token!).then((response) async {
      if (response.statusCode == 200) {
        print("logged out");
        clear();

        storage.delete(key: 'token');
        token = null;
        Get.defaultDialog(
            title: "success",
            middleText: "you have been successfully logged out!");

        Get.to(Login());
      } else {
        print(response.body);
      }
    });
  }
}
