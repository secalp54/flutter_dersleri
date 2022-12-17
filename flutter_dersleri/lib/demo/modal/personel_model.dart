class Personel {
  int? id;
  String? firstName;
  String? lastName;
  String? arabaAdi;

  Personel({this.id, this.firstName, this.lastName, this.arabaAdi});

  Personel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    arabaAdi = json['araba_adi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['araba_adi'] = this.arabaAdi;
    return data;
  }
}
