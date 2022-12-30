import 'package:flutter/material.dart';
import 'package:personel_app/pages/modals/personel.modal.dart';
import 'package:personel_app/pages/personel_detay.dart';
import 'package:personel_app/veri/veri.dart';

class ListePage extends StatelessWidget {
  ListePage({Key? key}) : super(key: key);
  final _title = "Personel Listesi";
  final List<PersonelModal> _liste = PersonelData().personelListesi;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [appBarr(), personelListesi()],
    );
  }

  SliverAppBar appBarr() {
    return SliverAppBar(
      pinned: false,
      floating: true,
      title: Text(_title),
      // ignore: prefer_const_constructors
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
      ),
    );
  }

  SliverList personelListesi() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: _liste.length, (context, index) {
      var personel = _liste[index];
      return GestureDetector(
        onLongPress: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(borderRadius:const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)) ),
              context: context,
              builder: (context) {
                return Wrap(
                  children: [
                    Card(
                      
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(child: Text(personel.cinsiyet!.substring(0,1)),),SizedBox(width: 5,), Text(personel.adiSoyadi!),
                                ],
                                
                              ),
                              Divider(),
                              Text(personel.bilgi!),
                              ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
                                  if (states==MaterialState.hovered) return Colors.amber;
                                })),
                                onPressed: (() => Navigator.of(context).pushNamed('/detay',arguments: personel)),child: Text("Detay")),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              });
        },
        onTap: () {
          //Navigator.of(context).pushNamed("/detay", arguments: personel);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonelDetay(modal: personel)));
          print("tıklandı");
        },
        child: Card(
          child: ListTile(
            leading: Image.network(personel.foto!),
            title: Text(personel.adiSoyadi!),
            subtitle: Text(personel.departman!),
          ),
        ),
      );
    }));
  }
}
