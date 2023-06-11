class CongeModel {
  String? id;
  String? type;
  String? startDate;
  String? endDate;
  String? description;
  String? proof;
  String? state;
  String? idEmploye;
  CongeModel({
    this.id,
    this.type,
    this.startDate,
    this.endDate,
    this.description,
    this.proof,
    this.state,
    this.idEmploye,
  });

  CongeModel.fromJson(Map<String?, dynamic> json) {
    this.type = json['type'];
    this.startDate = json['startDate'];
    this.endDate = json['endDate'];
    this.description = json['description'];
    this.proof = json['proof'];
    this.state = json['state'];
    this.idEmploye = json['idEmploye'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['description'] = this.description;
    data['proof'] = this.proof;
    data['state'] = this.state;
    data['idEmploye'] = this.idEmploye;
    return data;
  }
}
