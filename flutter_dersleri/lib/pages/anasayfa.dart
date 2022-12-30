import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dersleri/pages/navigators/profil.dart';

import 'package:flutter_dersleri/pages/roots/myroots.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../listview_ornek/personel_page.dart';

class AnaSayfa extends StatelessWidget {
  bool _ciksinMi = false;

  @override
  Widget build(BuildContext context) {
    String url =
        "https://pixabay.com/get/g8b8f2c6739ed50ab423c4d2bc5838803c7802598383c364a55d10dddb618fa4e1fd72f23b1c1e932f7c277d43a6f10308c1982898b789a6989fbb014718fe06b9b37842d763e4231c1c6ed830450de3f_640.jpg";
    return WillPopScope(
      //geri düğmesini yakalar
      onWillPop: () async {
        await _showDialog(context);
        print("Çıkış düğmesine basıldı değer: $_ciksinMi");
        return Future.value(_ciksinMi);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ana Sayfa"),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    //  Navigator.push(context, route);

                    Navigator.pushNamed(context, "/profil");
                  },
                  child: Text("Profil Sayfası")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => PersonelPage()));
                  },
                  child: Text("Liste Sayfası")),
            ],
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text("Dikkat"),
            content: Text("Çıkmak istediğinizden emin misiniz?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    _ciksinMi = true;
                    Navigator.pop(context);
                  },
                  child: Text("Evet")),
              ElevatedButton(
                  onPressed: () {
                    _ciksinMi = false;
                    Navigator.pop(context);
                  },
                  child: Text("Hayır")),
            ],
          );
        }));
  }
}




// class customCenter extends StatelessWidget {
//   final String url;
//    customCenter({required this.url}) 


//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: Colors.amber[100],
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image(height: 200, image: NetworkImage(url)),
//             Container(
//               color: Colors.blue[200],
//               width: 75,
//               height: 75,
//             ),
//             Container(
//               color: Colors.green[200],
//               width: 75,
//               height: 75,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
