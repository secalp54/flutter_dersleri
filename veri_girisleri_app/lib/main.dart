
import 'package:flutter/material.dart';
import 'package:veri_girisleri_app/text_field.dart';

import 'bki.dart';
import 'not_hesaplama.dart';

void main(){ 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.deepOrange
      ),
      title: 'Material App',
      home: BkiHesaplama(),
      
    );
  }
}