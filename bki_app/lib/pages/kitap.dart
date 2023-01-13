import 'package:bki_app/modals/kitap_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Kitaplar extends StatefulWidget {
  Kitaplar({Key? key}) : super(key: key);

  @override
  State<Kitaplar> createState() => _KitaplarState();
}

class _KitaplarState extends State<Kitaplar> {
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
      body: FutureBuilder(
          future: _kitaplariGetir(), //internetten kodaları getiren bir şey olmalı
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              //başarılı
              return ListView.builder(itemBuilder: ((context, index) {
                return Card(
                  child: Text(snapshot.data![index].title!),
                );
              }));
            } else if (snapshot.hasError) {
              //hata mesajı
              return Text("hata var");
            } else
              return Center(child: CircularProgressIndicator());
          })),
    );
  }

  Future<List<KitapModal>> _kitaplariGetir() async {
    String _url = "https://api.collectapi.com/book/newBook/";
    String _apiKey = 'apikey 5o8aJ6bTrn8GR5Ke36O18Y:6ZexX6OSIfS6lQT0GhY0xA';
    var cevap = await Dio().get(_url, options: Options(headers: {"Authorization": _apiKey}));
    if (cevap.statusCode == 200) {
      var veri = cevap.data as Map;
      print(veri["result"]);
      var liste = (veri["result"] as List).map((e) => KitapModal.fromJson(e)).toList();
      return Future.value(liste);
    } else
      return Future.value([]);
  }
}
