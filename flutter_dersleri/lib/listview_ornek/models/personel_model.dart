class PersonelModal {
  int? id;
  String? profilResmi;
  String? fullName;
  String? jopTitle;

  PersonelModal({this.id, this.profilResmi, this.fullName, this.jopTitle});

  PersonelModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profilResmi = json['profil_resmi'];
    fullName = json['full_name'];
    jopTitle = json['jop_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profil_resmi'] = this.profilResmi;
    data['full_name'] = this.fullName;
    data['jop_title'] = this.jopTitle;
    return data;
  }

  @override
  String toString() {
    return "${this.fullName} isimli kişinin iş bilgisi: ${this.jopTitle}";
  }
}
