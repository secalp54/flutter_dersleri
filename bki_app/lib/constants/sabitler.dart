import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StringSabitleri {
  static String uygulamaAdi = "BKİ";
  static String bkiFormKilo = "Kilonuzu giriniz";
  static String bkiFormBoy = "Boyunuzu metre olarak giriniz";
  static String hesaplaButtonName = "Hesapla";
  static String homeImageUrl = "https://assets7.lottiefiles.com/packages/lf20_l13zwx3i.json";
}

class RenkSabitleri {
  static MaterialColor temaRengi = Colors.deepOrange;
  static Color appBarRengi = Colors.transparent;
  static Color appBarTitleColor = Colors.black;
}

class HataMessaj {
  static String kiloBos = "Kilo Boş bırakılamaz!";
}

class StyleSabitleri {
  static TextStyle appBarTitleStyle =
      GoogleFonts.bakbakOne(fontSize: UygulamaFontSize.buyuk.deger(), color: RenkSabitleri.appBarTitleColor);

  static TextStyle sonucStyle = GoogleFonts.akayaKanadaka(fontSize: UygulamaFontSize.extraBuyuk.deger());
}

enum UygulamaFontSize { kucuk, orta, buyuk, extraBuyuk }

extension UygulamaFontSizeExtension on UygulamaFontSize {
  double deger() {
    switch (this) {
      case UygulamaFontSize.kucuk:
        return 16;
      case UygulamaFontSize.orta:
        return 25;
      case UygulamaFontSize.buyuk:
        return 30;
      case UygulamaFontSize.extraBuyuk:
        return 35;
    }
  }
}
