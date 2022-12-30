
import 'package:flutter/material.dart';
import 'package:peroson_app/sayfalar/anasayfa.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Anasayfa()
    );
  }
}