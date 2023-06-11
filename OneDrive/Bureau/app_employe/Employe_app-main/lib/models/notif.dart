class NotifModel {
  String? id;
  String? title;
  String? message;
  String? token;

  NotifModel({
    this.id,
    this.title,
    this.message,
    this.token,
  });

  NotifModel.fromJson(Map<String?, dynamic> json) {
    this.title = json['title'];
    this.message = json['message'];
    this.token = json['token'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}
