import 'package:flutter/material.dart';
import 'package:peroson_app/core/sayfalar.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _sayfaIndex = 0;
  final PageController _controller = PageController();
  var _sayfalar = Sayfalar.sayfalar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: altMenu(),
      body: PageView(
        controller: _controller,
        children: _sayfalar.map((e) => e.sayfa).toList(),
        onPageChanged: (value) {
          setState(() {
            _sayfaIndex = value;
          });
        },
      ),
    );
  }

  BottomNavigationBar altMenu() {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      showSelectedLabels: true,
      //backgroundColor: Colors.grey,
      items: _sayfalar
          .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.adi, backgroundColor: e.backColor))
          .toList(),

      selectedItemColor: Colors.red,
      currentIndex: _sayfaIndex,
      onTap: (value) {
        print(value);

        setState(() {
          _sayfaIndex = value;
          _controller.jumpToPage(_sayfaIndex);
        });
      },
    );
  }
}
