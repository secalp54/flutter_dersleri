import 'package:flutter/material.dart';
import 'dart:math';

class Sayac extends StatefulWidget {
  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int _sayac = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_home)),
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
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )));
  }

  void arttir() {
    _sayac++;
    debugPrint("1. aşama sayac arttı");
    setState(() {
      debugPrint("setstate çalıştı");
    });
    debugPrint("set statetin dışında");
  }

  void azalt() {
    if (_sayac >= 1) {
      _sayac--;
    }

    //  setState(() {});
  }
}
