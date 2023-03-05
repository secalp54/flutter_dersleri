import 'dart:html';

import 'package:deneme5/modals/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class Paket extends StatefulWidget {
  Paket({Key? key}) : super(key: key);

  @override
  State<Paket> createState() => _PaketState();
}

class _PaketState extends State<Paket> {
  @override
  void initState() {
    super.initState();
    _haberleriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: _haberleriGetir(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    var _haber = snapshot.data![index];
                    return Card(
                      child: Row(
                        children: [
                          //resim

                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 100,
                              color: Colors.amber,
                              child: Image.network(
                                _haber.image!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          //yazı

                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                children: [Text(_haber.name!)],
                              ),
                              height: 200,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    );
                  }));
            } else if (snapshot.hasError) {
              return Text("hata var");
            } else
              return Center(child: CircularProgressIndicator());
          })),
    );
  }

  Future<List<News>> _haberleriGetir() async {
    String _url =
        "https://api.collectapi.com/news/getNews?country=tr&tag=general";
    String _apiKey = 'apikey 4I9fG2FY718g4Bhi3q6bL1:3tciOsDw4GdsEA6QKKY69p';
    var cevap = await Dio().get(_url, options: Options(headers: {"Authorization": _apiKey}));
    if (cevap == 200) {
      var veri = cevap.data as Map;
      print(veri["result"]);
      var liste =
          (veri["result"] as List).map((e) => News.fromJson(e)).toList();
      return Future.value(liste);
    } else
      return Future.value([]);
  }
}
