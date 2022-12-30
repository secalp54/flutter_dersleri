import 'package:flutter/material.dart';
import 'package:personel_app/pages/routes/app_root.dart';

import 'pages/anasayfa.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _title = "Personel App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      title: _title,
      //home: AnaSayfa(),
      onGenerateRoute: MyAppRoutes.myRootes,
    );
  }
}
