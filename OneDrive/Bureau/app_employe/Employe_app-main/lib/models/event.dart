import 'dart:ui';

class Event {
  String? id;
  String? type;
  String? startDate;
  String? endDate;
  String? description;
  String? title;
  Color? color;

  Event({
    this.id,
    this.title,
    this.type,
    this.startDate,
    this.endDate,
    this.description,
    this.color,
  });

  Event.fromJson(Map<String?, dynamic> json) {
    this.title = json['title'];
    this.type = json['type'];
    this.startDate = json['to'];
    this.endDate = json['from'];
    this.description = json['description'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['type'] = this.type;
    data['to'] = this.startDate;
    data['from'] = this.endDate;
    data['description'] = this.description;

    return data;
  }

  @override
  String toString() {
    String? starttime = startDate!.substring(11);
    String? endtime = endDate!.substring(11);
    return '$title :  $description \nde  $starttime à  $endtime';
  }
}
