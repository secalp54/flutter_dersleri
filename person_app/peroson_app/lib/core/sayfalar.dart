import 'package:flutter/material.dart';
import 'package:peroson_app/sayfalar/ayarlar_sayfa.dart';
import 'package:peroson_app/sayfalar/hakimda_sayfa.dart';
import 'package:peroson_app/sayfalar/liste_sayfa.dart';

///sayfanın özelliklerini modelledik
class SayfaModel {
  final String adi;
  final Icon icon;
  final Color backColor;
  final Widget sayfa;

  SayfaModel({required this.backColor, required this.adi, required this.icon, required this.sayfa});
}

class Sayfalar {
  static final List<SayfaModel> sayfalar = [
    SayfaModel(adi: "Liste", icon: Icon(Icons.access_alarm), sayfa: ListeSayfasi(), backColor: Colors.black),
    SayfaModel(adi: "Hakkımda", icon: Icon(Icons.info), sayfa: HakkimdaSayfasi(),backColor: Colors.orange),
    SayfaModel(adi: "Ayar", icon: Icon(Icons.settings), sayfa: AyarlaSayfasi(),backColor: Colors.yellow),
    //SayfaModel(adi: "Test", icon: Icon(Icons.media_bluetooth_off), sayfa: Text(""),backColor: Colors.greenAccent),
  ];
}
