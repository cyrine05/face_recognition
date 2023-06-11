class MaterialModel {
  String? id;
  String? type;
  String? date;
  String? description;
  int? quantity;
  String? state;
  String? idEmploye;
  MaterialModel({
    this.id,
    this.type,
    this.date,
    this.description,
    this.quantity,
    this.state,
    this.idEmploye,
  });

  MaterialModel.fromJson(Map<String?, dynamic> json) {
    this.type = json['type'];
    this.date = json['date'];
    this.description = json['description'];
    this.quantity = json['quantity'];
    this.state = json['state'];
    this.idEmploye = json['idEmploye'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['date'] = this.date;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['state'] = this.state;
    data['idEmploye'] = this.idEmploye;
    return data;
  }
}
