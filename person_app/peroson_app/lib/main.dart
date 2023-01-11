
import 'package:flutter/material.dart';
import 'package:peroson_app/core/routes.dart';
import 'package:peroson_app/sayfalar/anasayfa.dart';
import 'package:peroson_app/test.dart';

import 'sayfalar/personel_detay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      title: 'Material App',
      onGenerateRoute: AppRoutes.rotalar,
    );
  }
}