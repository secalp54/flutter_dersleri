import 'package:flutter/material.dart';

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
            IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit)),
            IconButton(onPressed: (){}, icon: Icon(Icons.add_home)),
            
          ],
          backgroundColor: Colors.orange,
          title: Text("Sayac Uygulaması"),
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
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.exit_to_app_outlined),
              onPressed: () {
                debugPrint("tıklanıldı sayac: $_sayac");
                azalt();
              },
            ),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SAYAC",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              _sayac.toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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

    setState(() {});
  }
}
