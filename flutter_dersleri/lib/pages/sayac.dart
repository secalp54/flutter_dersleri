import 'package:flutter/material.dart';
import 'dart:math';

class Sayac extends StatefulWidget {
  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int _sayac = 0;
  Color _sayacRenk = Colors.blue;
  double _fontBuyuk = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  //buyult
                  fontBuyult();
                },
                icon: const Icon(Icons.ac_unit)),
            IconButton(
                onPressed: () {
                  //kucult
                  fontKucult();
                },
                icon: const Icon(Icons.add_home)),
          ],
          //backgroundColor: Colors.orange,
          title: const Text("Sayac Uygulaması"),
          centerTitle: true,
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                debugPrint("tıklanıldı sayac: $_sayac");
                arttir();
              },
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              //backgroundColor: Colors.red,
              child: const Icon(Icons.exit_to_app_outlined),
              onPressed: () {
                debugPrint("tıklanıldı sayac: $_sayac");
                setState(() {});
                azalt();
              },
            ),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.3)..rotateZ(-pi / 20.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: const Color(0xFFE8581C),
                  child: const Text('Sayac'),
                ),
              ),
            ),
            // const Text(
            //   "SAYAC",
            //   style: TextStyle(fontSize: 30),
            // ),
            Transform.rotate(
              angle: pi / 4 * _sayac,
              child: Text(
                _sayac.toString(),
                style: TextStyle(color: _sayacRenk, fontSize: _fontBuyuk, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )));
  }

  void arttir() {
    _sayac++;
    if (_sayac >= 0) _sayacRenk = Colors.blue;
    debugPrint("1. aşama sayac arttı");
    setState(() {
      debugPrint("setstate çalıştı");
    });
    debugPrint("set statetin dışında");
  }

  void azalt() {
    _sayac--;
    if (_sayac < 0) _sayacRenk = Colors.red;

    //  setState(() {});
  }

  void fontBuyult() {
    _fontBuyuk++;
    setState(() {
      
    });
  }

  fontKucult() {
    _fontBuyuk--;
    setState(() {
      
    });
  }
}
