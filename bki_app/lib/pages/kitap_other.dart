import 'package:bki_app/modals/kitap_modal.dart';
import 'package:bki_app/widget/card_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Kitaplarim extends StatefulWidget {
  Kitaplarim({Key? key}) : super(key: key);

  @override
  State<Kitaplarim> createState() => _KitaplarimState();
}

class _KitaplarimState extends State<Kitaplarim> {
  List<KitapModal> kitaplar = [];
  @override
  void initState() {
    // widget ilk çalıştığında çalışan metod
    super.initState();
    _kitaplariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Autocomplete<KitapModal>(
              onSelected: (option) {},
              optionsBuilder: ((value) async {
                //kitaplar = await _kitaplariGetir();
                if (value.text.isEmpty) {
                  return [];
                }
                //kitaplar listesindeki herbir kitabın title alanında textbox içinkei veriyi arattık.
                return kitaplar.where((k) => k.title!.toLowerCase().contains(value.text.toLowerCase())).toList();
              })),
          Expanded(
            child: Container(
              child: FutureBuilder(
                  future: _kitaplariGetir(), //internetten kodaları getiren bir şey olmalı
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      //başarılı
                      return GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ScreenUtil().orientation==Orientation.portrait?2:3),
                          itemBuilder: ((context, index) {
                            var kitapModal = snapshot.data![index];
                            return CardItem(kitapModal: kitapModal);
                          }));
                    } else if (snapshot.hasError) {
                      //hata mesajı
                      return Text("hata var");
                    } else
                      return Center(child: CircularProgressIndicator());
                  })),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<KitapModal>> _kitaplariGetir() async {
    String _url = "https://api.collectapi.com/book/newBook/";
    String _apiKey = 'apikey 0xGaKFHCIVASdJbWs1hdZU:7KA4qXu1jKoARwAmqMQjkS';
    var cevap = await Dio().get(_url, options: Options(headers: {"Authorization": _apiKey}));
    if (cevap.statusCode == 200) {
      var veri = cevap.data as Map;
      print(veri["result"]);
      var liste = (veri["result"] as List).map((e) => KitapModal.fromJson(e)).toList();
      kitaplar = liste;
      return Future.value(liste);
    } else
      return Future.value([]);
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}


// ListView.builder(
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: ((context, index) {
//                             var _kitap = snapshot.data![index];
//                             return CardItem(
//                               kitapModal: _kitap,
//                             );
//                           }));