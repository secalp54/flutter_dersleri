import 'package:flutter/material.dart';

class ScrollLearn extends StatelessWidget {
  List<String> liste = ["Ankara", "İstanbul", "Bursa"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return myCard(liste[index]);
          }),
          itemCount: liste.length,
        ));
  }

  SingleChildScrollView mySingleChildScroll() {
    return SingleChildScrollView(
      child: Center(
        child: Column(children: [
          
        ]),
      ),
    );
  }

  Card myCard(String isim) {
    return Card(
        color: Colors.blue[100],
        child: ListTile(
          title: Text(isim),
          subtitle: Text("Şehir"),
          leading: Icon(Icons.add_card),
          trailing: Icon(Icons.arrow_right_alt_rounded),
          onTap: () {
            debugPrint("Tıklandı");
          },
        ));
  }
}
