import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../hosts.dart';

abstract class MaterialService {
  static Future<http.Response> get(String token, String employeId) async {
    return await http.get(
        Uri.parse(Hosts.gatewayUrl + "/material/employe/" + employeId),
        headers: {
          "Authorization": "Bearer $token",
          "Content-type": "application/json",
          "Token": token
        });
  }

  static Future<http.Response> addMaterial(
      String token, Map<String, dynamic> materialData) async {
    return await http.post(Uri.parse(Hosts.gatewayUrl + "/material"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-type": "application/json",
          "Token": token
        },
        body: json.encode(materialData));
  }
}
