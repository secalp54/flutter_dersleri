import 'package:flutter/material.dart';
import 'package:flutter_dersleri/demo/data/veri.dart';
import 'package:flutter_dersleri/demo/modal/personel_model.dart';

class DemoScrol extends StatefulWidget {
  DemoScrol({Key? key}) : super(key: key);

  @override
  State<DemoScrol> createState() => _DemoScrolState();
}

class _DemoScrolState extends State<DemoScrol> {
  String _ogrenciAdi = "Ogr adi";
  String _arabaMarkasi = "pointac";
  var list = MyData().data.map<Personel>((e) => Personel.fromJson(e)).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: ((context, index) {
        return myCardWidget(list[index].firstName!+" "+list[index].lastName!, list[index].arabaAdi!);
      })),
    );
  }

  ListView klasikList() {
    return ListView(children: list.map<Card>((e) => myCardWidget(e.firstName!, e.arabaAdi!)).toList());
  }

  Card myCardWidget(String ogrAdi, String araba) {
    return Card(
      color: Colors.blue[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      child: ListTile(
        onTap: () {
          
        },
        title: Text(ogrAdi),
        subtitle: Text(araba),
      ),
    );
  }

  Card myCardItem() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
      color: Colors.red[300],
      child: ListTile(
        leading: Icon(Icons.mail),
        title: Text("Merhaba"),
        trailing: Icon(Icons.ice_skating),
      ),
    );
  }
}
