import 'package:flutter/material.dart';
import 'package:flutter_dersleri/pages/sayac.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home:Sayac() ,
    );
  }
}

