import 'package:bki_app/modals/kitap_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Kitaplar extends StatefulWidget {
  Kitaplar({Key? key}) : super(key: key);

  @override
  State<Kitaplar> createState() => _KitaplarState();
}

class _KitaplarState extends State<Kitaplar> {
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
          Autocomplete<KitapModal>(onSelected: (option) {

          }, optionsBuilder: ((value) async {
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
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            var _kitap = snapshot.data![index];
                            return Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  //Resim yeri
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      // color: Colors.amber,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          _kitap.image!,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //kitap bilgi yerleri
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            _kitap.title!,
                                            style: GoogleFonts.montserrat(fontSize: 16),
                                          ),
                                          Text(
                                            _kitap.yazar!,
                                            style: GoogleFonts.montserrat(fontSize: 14),
                                          ),
                                          Text(
                                            _kitap.yayN!,
                                            style: GoogleFonts.montserrat(fontSize: 16),
                                          ),
                                          Text(
                                            _kitap.fiyat!,
                                            style: GoogleFonts.montserrat(fontSize: 25, color: Colors.amber),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                _launchUrl(Uri.parse("sms:05055554466"));
                                              },
                                              child: Text("Göster"))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ));
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
    String _apiKey = 'apikey 5o8aJ6bTrn8GR5Ke36O18Y:6ZexX6OSIfS6lQT0GhY0xA';
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
