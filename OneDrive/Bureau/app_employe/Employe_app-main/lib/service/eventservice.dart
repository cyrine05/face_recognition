import 'package:http/http.dart' as http;

import '../hosts.dart';

abstract class EventService {
  static Future<http.Response> getEvents(String token) async {
    return await http.get(Uri.parse(Hosts.gatewayUrl + "/event"), headers: {
      "Authorization": "Bearer $token",
      "Content-type": "application/json",
      "Token": token
    });
  }
}
