import 'dart:collection';
import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart' as http;

import '../hosts.dart';

class UserService {
  static Future<http.Response> login(String email, String password) async {
    return await http.post(Uri.parse(Hosts.gatewayUrl + "/auth/authenticate"),
        headers: {"Content-type": "application/json"},
        body: json.encode({"email": email, "password": password}));
  }

  static Future<http.Response> logout(String token) async {
    return await http.post(
      Uri.parse(Hosts.gatewayUrl + "/auth/logout"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-type": "application/json",
        "Token": token
      },
    );
  }

  static Future<http.Response> changePassword(
      String token, String id, String password, String newPassword) async {
    return await http.put(
      Uri.parse((Hosts.gatewayUrl +
          "/employes/changePassword/$id?currentPassword=$password&newPassword=$newPassword")),
      headers: {
        "Authorization": "Bearer $token",
        "Content-type": "application/json",
        "Token": token
      },
    );
  }

  static Future<http.Response> updateEmploye(
      String token, String employeId, Map<String, dynamic> employeeData) async {
    return await http.put(
        Uri.parse(Hosts.gatewayUrl + "/employes/" + employeId),
        headers: {
          "Authorization": "Bearer $token",
          "Content-type": "application/json",
          "Token": token
        },
        body: json.encode(employeeData));
  }

  static Future<http.Response> saveDeviceToken(
      String token, String employeId, String device) async {
    return await http.put(
        Uri.parse(Hosts.gatewayUrl + "/employes/device/" + employeId),
        headers: {
          "Authorization": "Bearer $token",
          "Content-type": "application/json",
          "Token": token
        },
        body: json.encode(device));
  }

  static Future<http.Response> get(String token, String employeId) async {
    return await http
        .get(Uri.parse(Hosts.gatewayUrl + "/employes/" + employeId), headers: {
      "Authorization": "Bearer $token",
      "Content-type": "application/json",
      "Token": token
    });
  }

  Future<http.Response> uploadFile(String token, File file) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(Hosts.gatewayUrl + '/file/UploadFile'));

    request.headers.addAll({"Authorization": "Bearer $token", "Token": token});

    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }
}
