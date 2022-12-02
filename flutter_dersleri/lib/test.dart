import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  int _sayac = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add_card),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              debugPrint(_sayac.toString());
              sayaciArttir();
            },
            child: const Icon(Icons.exit_to_app_rounded),
          ),
        ],
      ),
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Sayac',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              '0',
              style: TextStyle(fontSize: 45),
            ),
          ],
        ),
      ),
    );
  }

  void sayaciArttir() {
    _sayac++;
  }
}
