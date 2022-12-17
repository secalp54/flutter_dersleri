import 'package:flutter/material.dart';
import 'package:flutter_dersleri/listview_ornek/models/personel_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'data/personel_data.dart';

class PersonelPage extends StatelessWidget {
  final _liste = PersonelData().data.map((eleman) => PersonelModal.fromJson(eleman)).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _liste.length,
          itemBuilder: ((context, index) {
            return Card(
              color: index % 2 == 0 ? Colors.blue[100] : Colors.white,
              child: ListTile(
                onTap: () {
                  //  EasyLoading.showSuccess(_liste[index].toString(),
                  // maskType: EasyLoadingMaskType.black);
                  dialogGoster(context, _liste[index]);
                },
                leading: FadeInImage.assetNetwork(
                    placeholder: "assets/resimler/loading.gif", image: _liste[index].profilResmi!),
                title: Text(_liste[index].fullName!),
                subtitle: Text(_liste[index].jopTitle!),
                trailing: const Icon(Icons.arrow_forward),
              ),
            );
          })),
    );
  }

  void dialogGoster(BuildContext cntx, PersonelModal person) {
    String _okButton = "Tamam";
    String _iptalButton = "İptal";
    showDialog(
        barrierDismissible: false,
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
                    Navigator.pop(cntx);//sayfa kapatma
                  },
                  child: Text(_iptalButton)),
            ],
          );
        }));
  }
}
