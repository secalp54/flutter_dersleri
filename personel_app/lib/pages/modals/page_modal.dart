import 'package:flutter/material.dart';
import 'package:personel_app/pages/ayarlar.dart';
import 'package:personel_app/pages/hakkinda.dart';
import 'package:personel_app/pages/liste_page.dart';

class PageModal {
  final String label;
  final IconData icon;
  final Widget widget;

  PageModal( {required this.widget,required this.label, required this.icon});
}

class BottomPages {
  static List<PageModal> pages = [
    PageModal(label: Pages.anasayfa.name, icon: Icons.home,widget:Pages.anasayfa.widget),
    PageModal(label: Pages.hakkinda.name, icon: Icons.info ,widget:Pages.hakkinda.widget),
    PageModal(label: Pages.ayarlar.name, icon: Icons.settings,widget:Pages.ayarlar.widget)
  ];
}

enum Pages { anasayfa, hakkinda, ayarlar }

extension PagesExtension on Pages {
  String get name {
    switch (this) {
      case Pages.anasayfa:
        return "Anasayfa";

      case Pages.hakkinda:
        return "Hakkında";

      case Pages.ayarlar:
        return "Ayarlar";
    }
  }

  Widget get widget {
    switch (this) {
      case Pages.anasayfa:
        return ListePage();
      case Pages.hakkinda:
        return HakkindaPage();
      case Pages.ayarlar:
        return AyarlarPage();
    }
  }
}
