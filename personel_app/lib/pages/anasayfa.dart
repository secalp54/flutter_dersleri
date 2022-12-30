import 'package:flutter/material.dart';
import 'package:personel_app/pages/modals/page_modal.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _index = 0;
  var _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      bottomNavigationBar: bottomNavigation(),
      body: PageView(
        onPageChanged: ((value) {
          setState(() {
            _index = value;
          });
        }),
        controller: _pageController,
        children: BottomPages.pages.map((e) => e.widget).toList(),
      ),

      //BottomPages.pages[_index].widget,
    );
  }

  BottomNavigationBar bottomNavigation() {
    return BottomNavigationBar(
        onTap: _onTabEvent,
        selectedItemColor: Colors.amber,
        currentIndex: _index,
        items: BottomPages.pages.map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.label)).toList());
  }

  void _onTabEvent(int value) {
    setState(() {
      _index = value;
      _pageController.jumpToPage(_index);
    });
  }
}
