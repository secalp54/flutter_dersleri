class PersonelModel {
  int? id;
  String? adiSoyadi;
  String? cinsiyet;
  String? isKategorisi;
  String? foto;
  String? email;
  String? departman;
  String? mezunOkul;
  String? sirket;
  String? ulke;
  String? telefon;
  String? bilgi;

  PersonelModel(
      {this.id,
      this.adiSoyadi,
      this.cinsiyet,
      this.isKategorisi,
      this.foto,
      this.email,
      this.departman,
      this.mezunOkul,
      this.sirket,
      this.ulke,
      this.telefon,
      this.bilgi});

  PersonelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adiSoyadi = json['adi_soyadi'];
    cinsiyet = json['cinsiyet'];
    isKategorisi = json['is_kategorisi'];
    foto = json['foto'];
    email = json['email'];
    departman = json['departman'];
    mezunOkul = json['mezun_okul'];
    sirket = json['sirket'];
    ulke = json['ulke'];
    telefon = json['telefon'];
    bilgi = json['bilgi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['adi_soyadi'] = this.adiSoyadi;
    data['cinsiyet'] = this.cinsiyet;
    data['is_kategorisi'] = this.isKategorisi;
    data['foto'] = this.foto;
    data['email'] = this.email;
    data['departman'] = this.departman;
    data['mezun_okul'] = this.mezunOkul;
    data['sirket'] = this.sirket;
    data['ulke'] = this.ulke;
    data['telefon'] = this.telefon;
    data['bilgi'] = this.bilgi;
    return data;
  }
}
