import 'package:flutter/material.dart';

import 'package:flutter_dersleri/pages/dropMenu/drop_down.dart';
import 'package:flutter_dersleri/pages/dropMenu/popup_uygulama.dart';
import 'package:flutter_dersleri/pages/sayac.dart';
import 'package:flutter_dersleri/tema/my_tema.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BenimTema().light,
      debugShowCheckedModeBanner: false,
      home: Sayac(),
    );
  }
}
