import 'dart:collection';
import 'dart:convert';
import 'package:app_employe/controllers/eventcontroller.dart';
import 'package:app_employe/events.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/UserController.dart';
import '../models/event.dart';
import '../service/eventservice.dart';

Map<DateTime, List<Event>> kEventSource = {};
final EventController eventController = Get.put(EventController());

fetchData() {
  eventController.events.forEach((element) {
    int year = int.parse(element.startDate!.substring(0, 4));
    print(year);
    int month = int.parse(element.startDate!.substring(5, 7));
    print(month);
    int day = int.parse(element.startDate!.substring(8, 10));
    print(day);

    kEventSource[DateTime(
      year,
      month,
      day,
    )] = kEventSource[DateTime(
              year,
              month,
              day,
            )] !=
            null
        ? [
            ...?kEventSource[DateTime(
              year,
              month,
              day,
            )],
          ]
        : [
            Event(
                title: element.title,
                description: element.description,
                startDate: element.startDate,
                endDate: element.endDate)
          ];
  });
  print("keveeeeeeeent");
  print(kEventSource);
  kEvents = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
    // actual code
  )..addAll(kEventSource);

  return eventController.events;
}

var kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
  // actual code
)..addAll(kEventSource);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  // print(dayCount);
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(2022);
final kLastDay = DateTime(2062);
