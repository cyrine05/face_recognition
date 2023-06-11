class ReclamationModel {
  String? id;
  String? topic;
  String? description;
  String? idEmploye;

  ReclamationModel({
    this.id,
    this.topic,
    this.description,
    this.idEmploye,
  });

  ReclamationModel.fromJson(Map<String?, dynamic> json) {
    this.topic = json['topic'];
    this.description = json['description'];
    this.idEmploye = json['idEmploye'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic'] = this.topic;
    data['description'] = this.description;
    data['idEmploye'] = this.idEmploye;
    return data;
  }
}
