import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../hosts.dart';

abstract class CongeService {
  static Future<http.Response> get(String token, String employeId) async {
    return await http.get(
        Uri.parse(Hosts.gatewayUrl + "/conge/employe/" + employeId),
        headers: {
          "Authorization": "Bearer $token",
          "Content-type": "application/json",
          "Token": token
        });
  }

  static Future<http.Response> addConge(
      String token, Map<String, dynamic> congeData) async {
    return await http.post(Uri.parse(Hosts.gatewayUrl + "/conge"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-type": "application/json",
          "Token": token
        },
        body: json.encode(congeData));
  }

  static Future<http.Response> getAll(String token) async {
    return await http.get(Uri.parse(Hosts.gatewayUrl + "/conge"),
        headers: {"Content-type": "application/json", "Token": token});
  }
}
