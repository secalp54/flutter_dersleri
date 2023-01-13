class KitapModal {
  String? url;
  String? indirim;
  String? fiyat;
  String? yayN;
  String? yazar;
  String? title;
  String? image;

  KitapModal(
      {this.url,
      this.indirim,
      this.fiyat,
      this.yayN,
      this.yazar,
      this.title,
      this.image});

  KitapModal.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    indirim = json['indirim'];
    fiyat = json['fiyat'];
    yayN = json['yayın'];
    yazar = json['yazar'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['indirim'] = this.indirim;
    data['fiyat'] = this.fiyat;
    data['yayın'] = this.yayN;
    data['yazar'] = this.yazar;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}
