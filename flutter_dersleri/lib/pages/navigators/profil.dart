import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,//appbardaki geri düğmesinin görülebilirliği
        title: Text("Profil Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              //  style: Theme.of(context).elevatedButtonTheme.style.copyWith(backgroundColor: ),
                onPressed: () {
                  Navigator.pop(context,50);//üstteki sayfayı siler
                },
                child: Text("Anasayfa")),
                
          ],
        ),
      ),
    );
  }
}
