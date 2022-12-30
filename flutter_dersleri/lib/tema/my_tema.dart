import 'package:flutter/material.dart';

class BenimTema {
  ThemeData light = ThemeData.light().copyWith(
      
      appBarTheme: AppBarTheme(backgroundColor: Renklerim.appBarColor, elevation: 0),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Renklerim.fbColor,
      ),
       
      );
      
  ThemeData dark = ThemeData.dark();
}

class Renklerim {
  static Color appBarColor = Colors.orange; //appbar rengi
  static Color fbColor = Colors.deepPurple; //floating action button rengi
}

