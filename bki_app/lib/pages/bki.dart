import 'dart:convert';

import 'package:bki_app/constants/sabitler.dart';
import 'package:bki_app/veri.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class BkiHesapla extends StatefulWidget {
  const BkiHesapla({Key? key}) : super(key: key);

  @override
  State<BkiHesapla> createState() => _BkiHesaplaState();
}

class _BkiHesaplaState extends State<BkiHesapla> {
  TextEditingController _kiloController = TextEditingController();
  TextEditingController _boyController = TextEditingController();
  final _formState = GlobalKey<FormState>(); //form bilgileri için
  String _mesaj = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: RenkSabitleri.appBarRengi,
        elevation: 0,
        title: Text(StringSabitleri.uygulamaAdi, style: StyleSabitleri.appBarTitleStyle),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 3, //ekranınızın yüksekliği
                    child: LottieBuilder.network(StringSabitleri.homeImageUrl)),
                //* kilo alanı
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == "")
                        return HataMessaj.kiloBos;
                      else
                        return null;
                    },
                    onSaved: (value) {
                      _kiloController.text = value ?? "0";
                    },
                    controller: _kiloController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.amber[50],
                        labelText: StringSabitleri.bkiFormKilo,
                        hintText: StringSabitleri.bkiFormKilo,
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                  ),
                ),
                //*boy alanı
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _boyController.text = value ?? "0";
                    },
                    controller: _boyController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.amber[50],
                        labelText: StringSabitleri.bkiFormBoy,
                        hintText: StringSabitleri.bkiFormBoy,
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                  ),
                ),
                //*button alanı

               
                ElevatedButton(
                    onPressed: () {
                      if (_formState.currentState!.validate()) {
                        _formState.currentState!.save();
                        print("Boy: ${_boyController.text} kilo: ${_kiloController.text}");
                        setState(() {
                          _mesaj = _bkiHesapla(_boyController.text, _kiloController.text);
                        });

                        print(_mesaj);
                      }
                    },
                    child: Text(StringSabitleri.hesaplaButtonName)),
                Text(
                  _mesaj,
                  style: StyleSabitleri.sonucStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _bkiHesapla(String boy, String kilo) {
    double boyDegeri = double.parse(boy);
    double kiloDegeri = double.parse(kilo);
    String _msg = "";
    var sonuc = (kiloDegeri / (boyDegeri * boyDegeri));
    if (sonuc < 18)
      _msg = "Zayıfsınız";
    else if (sonuc < 24)
      _msg = "ideal kilo";
    else if (sonuc < 30)
      _msg = "Fazla Kilo";
    else
      _msg = "Obez";

    return _msg;
  }
}




