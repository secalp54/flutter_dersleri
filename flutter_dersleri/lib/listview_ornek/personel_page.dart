import 'package:flutter/material.dart';
import 'package:flutter_dersleri/listview_ornek/models/personel_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'data/personel_data.dart';

class PersonelPage extends StatelessWidget {
  final _liste = PersonelData().data.map((eleman) => PersonelModal.fromJson(eleman)).toList();
  @override
  Widget build(BuildContext context) {
    String _title = 'Personel Listesi';
    return CustomScrollView(slivers: [
       SliverAppBar(
      
        centerTitle: true,
        floating: true,
        pinned: true,
        expandedHeight: 100.0,
        flexibleSpace: FlexibleSpaceBar(
        // background: ,
          title: Text(_title),
        ),
      ),
     // sliverFixExtended(),
     SliverList(delegate: SliverChildBuilderDelegate(childCount: _liste.length,
      
      (context, index) => myListCard(index, context)
      ))
    ]);
  }

  SliverFixedExtentList sliverFixExtended() {
    return SliverFixedExtentList(
      itemExtent: _liste.length.toDouble(),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return myListCard(index, context);
        },
      ),
    );
  }

  SliverToBoxAdapter myContainer(int i, BuildContext contex) {
    return SliverToBoxAdapter(
      child: Text("m"),
    );
  }

  Card myListCard(int index, BuildContext context) {
    return Card(
      color: index % 2 == 0 ? Colors.blue[100] : Colors.white,
      child: ListTile(
        onTap: () {
          //  EasyLoading.showSuccess(_liste[index].toString(),
          // maskType: EasyLoadingMaskType.black);
          dialogGoster(context, _liste[index]);
        },
        leading:
            FadeInImage.assetNetwork(placeholder: "assets/resimler/loading.gif", image: _liste[index].profilResmi!),
        title: Text(_liste[index].fullName!),
        subtitle: Text(_liste[index].jopTitle!),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }

  void dialogGoster(BuildContext cntx, PersonelModal person) {
    String _okButton = "Tamam";
    String _iptalButton = "İptal";
    showDialog(
        context: cntx,
        builder: ((cntx) {
          return AlertDialog(
            title: Image.network(
              person.profilResmi!,
              height: 70,
            ),
            content: SingleChildScrollView(
                child: Column(
              children: [Text(person.fullName!), Divider(), Text(person.jopTitle!)],
            )),
            actions: [
              TextButton(onPressed: () {}, child: Text(_okButton)),
              TextButton(
                  onPressed: () {
                    Navigator.pop(cntx); //sayfa kapatma
                  },
                  child: Text(_iptalButton)),
            ],
          );
        }));
  }
}
