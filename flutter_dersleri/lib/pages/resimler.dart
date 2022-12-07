import 'package:flutter/material.dart';
import 'package:flutter_dersleri/strings/app_strings.dart';

class Resimler extends StatelessWidget {
  final String _imgUrl =
      "https://pixabay.com/get/g4c3c1c1649eecfc0dca20c7f639958d33f6a2673ff62e0795b7e5e0fbe7441590d56a63dba09cdf16bf8cc32924d5cc0daa8a7e74a64c4df89f2b533136808ffa6da7a4b223fddb5aeb0f3b7bde1dc7c_640.jpg";
  final String _imgRandomUrl = "https://picsum.photos/200";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appTitle),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ignore: sized_box_for_whitespace
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(_imgRandomUrl, fit: BoxFit.cover),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: Image.asset('assets/resimler/kedi.jpg'),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  child: const CircleAvatar(
                    radius: 150,
                    child: Text("MA"),
                  ),
                )),
            TextButton(onPressed: () {}, child: const Text("Profili Düzenle")),
            TextButton.icon(onPressed: () {}, icon: const Icon(Icons.share), label: const Text("Paylaş")),
            ElevatedButton(onPressed: () {}, child: const Text("Kaydet")),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.abc), label: const Text("Kaydet"))
          ],
        ),
      ),
    );
  }
}
