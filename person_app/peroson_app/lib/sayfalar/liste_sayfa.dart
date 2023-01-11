import 'package:flutter/material.dart';
import 'package:peroson_app/data/veri.dart';
import 'package:peroson_app/modals/personel_modal.dart';
import 'package:peroson_app/sayfalar/personel_detay.dart';

// ignore: must_be_immutable
class ListeSayfasi extends StatelessWidget {
  ListeSayfasi({Key? key}) : super(key: key);
  // ignore: prefer_final_fields
  var _personelListesi = PersonelData().personelListesi;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [sliverAppBar(), sliverPersonelListesi(context)],
    );
  }

  SliverAppBar sliverAppBar() {
    return const SliverAppBar(
      floating: true,
      title: Text("Personel Listesi"),
    );
  }

  SliverList sliverPersonelListesi(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: _personelListesi.length, ((context, index) {
      var personel = _personelListesi[index];
      return GestureDetector(
        onTap: () {
          //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: ((context) => PersonelDetay())));
          // Navigator.push(context, MaterialPageRoute(builder: (context) => PersonelDetay()));
          Navigator.of(context).pushNamed("/personelDetay",
          arguments:personel );
        },
        onLongPress: () {
          _openBottomSheed(context, personel);
        },
        child: Card(
          child: ListTile(
            leading: Image.network(personel.foto!),
            title: Text(personel.adiSoyadi!),
            subtitle: Text(personel.email!),
            trailing: const Icon(Icons.arrow_left),
          ),
        ),
      );
    })));
  }

  void _openBottomSheed(BuildContext context, PersonelModel personel) {
    showModalBottomSheet(
        isDismissible: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        context: context,
        builder: ((context) {
          return Center(
            child: Column(
              children: [
                Image.network(personel.foto!),
                Divider(), //*çizgi atar
                Text(
                  personel.adiSoyadi!,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(personel.telefon!, style: Theme.of(context).textTheme.bodyMedium)
              ],
            ),
          );
        }));
  }
}
