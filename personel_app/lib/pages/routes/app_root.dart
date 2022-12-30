

import 'package:flutter/material.dart';
import 'package:personel_app/pages/anasayfa.dart';
import 'package:personel_app/pages/modals/personel.modal.dart';
import 'package:personel_app/pages/personel_detay.dart';

class MyAppRoutes {
  static Route<dynamic>? myRootes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => AnaSayfa());
      case "/detay":
        return MaterialPageRoute(builder: (context) => PersonelDetay(modal: settings.arguments as PersonelModal,));
    }
  }
}
