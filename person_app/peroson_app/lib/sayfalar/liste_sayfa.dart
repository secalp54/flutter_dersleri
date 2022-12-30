import 'package:flutter/material.dart';
import 'package:peroson_app/data/veri.dart';

class ListeSayfasi extends StatelessWidget {
  ListeSayfasi({Key? key}) : super(key: key);
  var _personelListesi = PersonelData().personelListesi;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(),
        SliverList(
            delegate: SliverChildBuilderDelegate(childCount: _personelListesi.length, ((context, index) {
          var personel = _personelListesi[index];
          return Card(
            child: ListTile(
              leading:Image.network(personel.foto!) ,
              title: Text(personel.adiSoyadi!),
              subtitle: Text(personel.email!),
              trailing: Icon(Icons.arrow_left),
            ),
          );
        })))
      ],
    );
  }
}
