import 'package:app_employe/models/event.dart';

import 'package:get/get.dart';
import 'dart:convert';

import '../service/eventservice.dart';
import 'UserController.dart';

class EventController extends GetxController {
  Rx<Event> _Event = Event().obs;
  var events = <Event>[].obs;
  Event get event => _Event.value;
  final UserController Usercontroller = Get.put(UserController());

  set user(Event value) => this._Event.value = value;

  void clear() {
    _Event.value = Event();
  }

  @override
  onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    await EventService.getEvents(Get.find<UserController>().token.toString())
        .then((response) async {
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse =
            jsonDecode(utf8.decode(response.bodyBytes));
        events.value =
            jsonResponse.map((eventJson) => Event.fromJson(eventJson)).toList();

        print(events.value.toList());
        print("it works");
      } else {
        throw Exception('Failed to get data');
      }
      update();
    });
  }
}
