
import 'package:bki_app/constants/sabitler.dart';
import 'package:bki_app/pages/bki.dart';
import 'package:bki_app/pages/urunler.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:RenkSabitleri.temaRengi,
        visualDensity:VisualDensity.adaptivePlatformDensity 
      ),
      title: StringSabitleri.uygulamaAdi,
      home: UrunListele(),
    );
  }
}