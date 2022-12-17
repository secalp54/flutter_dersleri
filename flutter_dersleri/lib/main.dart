import 'package:flutter/material.dart';
import 'package:flutter_dersleri/demo/test.dart';
import 'package:flutter_dersleri/listview_ornek/data/personel_data.dart';
import 'package:flutter_dersleri/pages/grd_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'demo/pdf_view.dart';
import 'gridview/grid_view.dart';
import 'listview_ornek/personel_page.dart';
import 'tema/my_tema.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.blue
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BenimTema().light,
      debugShowCheckedModeBanner: false,
      home: GridViewx(),
      builder: EasyLoading.init(),
     
    );
  }
}
