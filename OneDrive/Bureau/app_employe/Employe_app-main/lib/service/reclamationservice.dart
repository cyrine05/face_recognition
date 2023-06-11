import 'dart:convert';
import 'package:http/http.dart' as http;

import '../hosts.dart';

abstract class ReclamationService {
  static Future<http.Response> sendReclamation(
      String token, Map<String, dynamic> reclamationData) async {
    return await http.post(Uri.parse(Hosts.gatewayUrl + "/reclamations"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-type": "application/json",
          "Token": token
        },
        body: json.encode(reclamationData));
  }
}
