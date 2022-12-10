class SehirModal {
  String? bolge;
  int? id;
  String? il;
  String? ilce;
  int? plaka;

  SehirModal({this.bolge, this.id, this.il, this.ilce, this.plaka});

  SehirModal.fromJson(Map<String, dynamic> json) {
    bolge = json['bolge'];
    id = json['id'];
    il = json['il'];
    ilce = json['ilce'];
    plaka = json['plaka'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bolge'] = this.bolge;
    data['id'] = this.id;
    data['il'] = this.il;
    data['ilce'] = this.ilce;
    data['plaka'] = this.plaka;
    return data;
  }
}
