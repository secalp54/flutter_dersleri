

import 'package:bki_app/constants/sabitler.dart';
import 'package:bki_app/core/background.dart';

import 'package:bki_app/pages/kitap_other.dart';


import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBackServices services = AppBackServices();
  services.initializeService();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return ScreenUtilInit(
            designSize: Size(1080, 1920),
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primarySwatch: RenkSabitleri.temaRengi, visualDensity: VisualDensity.adaptivePlatformDensity),
                title: StringSabitleri.uygulamaAdi,
                home: Kitaplarim(),
              );
            });
      },
    );
  }
}
