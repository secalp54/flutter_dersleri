import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:timezone/timezone.dart';
import 'package:veri_girisleri_app/notification/notification.dart';
import 'package:timezone/data/latest.dart' as tz;

class BkiHesaplama extends StatefulWidget {
  const BkiHesaplama({Key? key}) : super(key: key);

  @override
  State<BkiHesaplama> createState() => _BkiHesaplamaState();
}

class _BkiHesaplamaState extends State<BkiHesaplama> {
  final _formState = GlobalKey<FormState>();
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _kiloController = TextEditingController();
  final TextEditingController _boyController = TextEditingController();
  final _focusNode = FocusNode();
  late MyNotification notify;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notify = MyNotification.Init(context: context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Form(
        key: _formState,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(400),
                      child: LottieBuilder.network("https://assets1.lottiefiles.com/private_files/lf30_t6bqxuik.json")),
                ),
                myTextForm(
                    label: "Adınız",
                    controller: _adController,
                    preIcon: const Icon(Icons.person),
                    onSaved: (value) {},
                    validate: _validateMethot),
                myTextForm(
                  controller: _kiloController,
                  label: "Kilonuz",
                  preIcon: const Icon(Icons.person),
                  onSaved: (value) {},
                  validate: _validateMethot,
                ),
                myTextForm(
                  controller: _boyController,
                  label: "Boyunuz",
                  preIcon: const Icon(Icons.person),
                  onSaved: (value) {},
                  validate: _validateMethot,
                ),
                ElevatedButton(
                    onPressed: () {
                      final location = getLocation("Turkey/Sakarya");
                      final annularEclipse = TZDateTime.now(location).add(const Duration(seconds: 5));

                      //  notify.sendMessage("Merhaba Dünya","Önemli Duyuru","Bu haftaki davete katılmalısınız.");
                      notify.scheduleMonthly(1, "mesaj", "title", annularEclipse, "Merhaba");
                      if (_formState.currentState!.validate()) {
                        print(_adController.text);
                        _focusNode.addListener(() {
                          if (_focusNode.hasFocus) {
                            print("has focus");
                          }
                        });
                      }
                    },
                    child: const Text("Hesapla")),
                Image.asset('assets/img/1.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validateMethot(value) {
    if (value == "") return "Boş geçilemez";

    if (double.tryParse(value) != null) {
      double? deger = double.tryParse(value);
      if (deger! < 0 || deger > 100) return "0-100 arasında olmalı";
    } else {
      if (value.toString().length < 3) return "adınızı giriniz";
    }
    return null;
  }

  SizedBox myTextForm(
      {TextEditingController? controller,
      required String label,
      required Icon preIcon,
      Function(String?)? onSaved,
      String? Function(String?)? validate}) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          focusNode: _focusNode,
          textInputAction: TextInputAction.next,
          onSaved: onSaved,
          controller: controller,
          validator: validate,
          style: GoogleFonts.adamina(fontSize: 14),
          //controller:controller ,
          decoration: InputDecoration(
            labelStyle: GoogleFonts.montserrat(fontSize: 14),
            filled: true,
            fillColor: Colors.orange.shade100,
            focusColor: Colors.orange,
            labelText: label,
            prefixIcon: preIcon,
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
          ),
        ),
      ),
    );
  }
}
