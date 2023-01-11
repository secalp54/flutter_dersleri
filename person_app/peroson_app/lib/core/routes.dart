import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:peroson_app/modals/personel_modal.dart';
import 'package:peroson_app/sayfalar/anasayfa.dart';
import 'package:peroson_app/sayfalar/personel_detay.dart';

class AppRoutes {
  static Route<dynamic> rotalar(RouteSettings settings) {
    
    switch (settings.name) {
      case "/personelDetay":
        if (defaultTargetPlatform==TargetPlatform.android) {
          return MaterialPageRoute(builder: ((context) =>  PersonelDetay(personel: settings.arguments as PersonelModel,)));
        } else {
          return CupertinoPageRoute(builder: ((context) =>  PersonelDetay(personel: settings.arguments as PersonelModel)));
        }

      case "/":
        return MaterialPageRoute(builder: ((context) => Anasayfa()));
      default:
        return  MaterialPageRoute(builder: ((context) => Anasayfa()));
    }
    
  }
}
