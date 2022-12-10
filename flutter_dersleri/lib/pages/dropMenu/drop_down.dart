import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _secilenDeger;
  final List<String> _sehirler = ["Ankara", "İstanbul", "Sakarya", "Kocaeli", "Sivas"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("DropDown menü"),
            DropdownButton<String>(
              hint: const Text("Seçiniz..."),
              icon: const Icon(Icons.self_improvement_sharp),
              items: _sehirler
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _secilenDeger = value ?? "Ankara";
                  debugPrint("onchanged çalıştı: $_secilenDeger");
                });
              },
              value: _secilenDeger,
            ),
            PopupMenuButton(itemBuilder: ((context) {
              return [
                PopupMenuItem(
                  child: Text("Ankara"),
                  onTap: () {
                    debugPrint("ankara tıklandı");
                  },
                ),
                PopupMenuItem(child: Text("Istanbul")),
              ];
            }))
          ],
        ),
      ),
    );
  }
}
