import '../hosts.dart';
import 'package:http/http.dart' as http;

abstract class NotifService {
  static Future<http.Response> get(String deviceToken) async {
    return await http.get(
      Uri.parse(Hosts.gatewayUrl + "/notifications/" + deviceToken),
    );
  }
}
