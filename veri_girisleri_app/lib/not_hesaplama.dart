

import 'package:flutter/material.dart';

class NotHesaplama extends StatefulWidget {
  NotHesaplama({Key? key}) : super(key: key);

  @override
  State<NotHesaplama> createState() => _NotHesaplamaState();
}

class _NotHesaplamaState extends State<NotHesaplama> {
  String _vize = "0";
  String _final = "0", _mesaj = "", _ad = "";

  String _adLabel = "Adınızı Giriniz";
  String _vizeLabel = "Vize notunu giriniz";
  String _finalLabel = "Final notunu giriniz";
  Widget _nameIcon = Icon(Icons.person);
  Widget _vizeIcon = Icon(Icons.calculate);
  Widget _finalIcon = Icon(Icons.calculate);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(_mesaj),
                  TextFormField(
                    onSaved: (value) {
                      _ad = value!;
                    },

                    validator: (value) {
                      if ((value?.length ?? 0) > 2) {
                        return null;
                      } else
                        return "Lütfen adınızı giriniz.";
                    },
                    //controller:controller ,
                    decoration: InputDecoration(
                      labelText: _adLabel,
                      prefixIcon: _nameIcon,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    //controller:controller ,
                    validator: (value) {
                      //! try ile hatayı yakalanacak
                      if (value == "") value = "-1";
                      int deger = int.parse(value ?? "-1");
                      if (deger >= 0 && deger <= 100) {
                        return null;
                      }
                      return "0-100 arası bir değer giriniz.";
                    },
                    onSaved: (value) {
                      _vize = value!;
                    },
                    decoration: InputDecoration(
                      labelText: _vizeLabel,
                      prefixIcon: _vizeIcon,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      //! try ile hatayı yakalanacak
                      if (value == "") value = "-1";
                      int deger = int.parse(value ?? "-1");
                      if (deger >= 0 && deger <= 100) {
                        return null;
                      }
                      return "0-100 arası bir değer giriniz.";
                    },
                    onSaved: (value) {
                      _final = value!;
                    },
                    //controller:controller ,
                    decoration: InputDecoration(
                      labelText: _finalLabel,
                      prefixIcon: _finalIcon,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: (() {
                        if (_formKey.currentState!.validate()) {
                          //tüm herşey tamm işlemi yap
                          _formKey.currentState!.save();

                          double sonuc = (int.parse(_vize) + int.parse(_final)) / 2;
                          setState(() {
                            _mesaj = "Sayın $_ad ortalamanız : $sonuc";
                          });
                          
                        }
                      }),
                      child: Text("Kaydet"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField myTextForm({required String label, required preIcon, required Function(String?)? onSaved}) {
    return TextFormField(
      onSaved: onSaved,
      //controller:controller ,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: preIcon,
      ),
    );
  }
}
