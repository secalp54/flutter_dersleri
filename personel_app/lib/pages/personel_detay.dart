import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:personel_app/pages/modals/personel.modal.dart';

class PersonelDetay extends StatefulWidget {
  PersonelDetay({Key? key, required this.modal}) : super(key: key);
  final PersonelModal modal;

  @override
  State<PersonelDetay> createState() => _PersonelDetayState();
}

class _PersonelDetayState extends State<PersonelDetay> {
  String _msg = "";
  Color _appBarColor = Colors.transparent;
  Color _textColor = Colors.black;
  Color _titleColor = Colors.black;
  late PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    _updatePaletteGenerator();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _appBarColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            backgroundColor: _appBarColor,
            flexibleSpace: FlexibleSpaceBar(
             // title: Text(widget.modal.adiSoyadi!,
             //     style: Theme.of(context).textTheme.bodySmall!.copyWith(color: _titleColor)),
              background: Image.network(widget.modal.foto!),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            bilgiCard(widget.modal.adiSoyadi!, "Adı Soyadı", context),
            bilgiCard(widget.modal.bilgi!, "Personel Bilgi", context),
            bilgiCard(widget.modal.cinsiyet!, "Cinsiyet", context),
            bilgiCard(widget.modal.departman!, "Departmanı", context),
            bilgiCard(widget.modal.email!, "E mail", context),
            bilgiCard(widget.modal.isKategorisi!, "İş Kategorisi", context),
            bilgiCard(widget.modal.mezunOkul!, "Mezun Olduğu Okul", context),
            bilgiCard(widget.modal.sirket!, "Şirket", context),
            bilgiCard(widget.modal.telefon!, "Telefon", context),
            bilgiCard(widget.modal.ulke!, "Ülke", context),
          ])),
        ],
      ),
    );
  }

  Card bilgiCard(String msg, String bilgi, BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              bilgi,
              style: Theme.of(context).textTheme.headline6!.copyWith(color: _titleColor),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Text(msg, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: _textColor)),
          ],
        )),
      ),
    );
  }

  _updatePaletteGenerator() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(NetworkImage(widget.modal.foto!));
    _appBarColor = paletteGenerator.dominantColor?.color ?? Colors.transparent;
    _textColor = paletteGenerator.darkVibrantColor?.color ?? Colors.transparent;
    _titleColor = paletteGenerator.lightVibrantColor?.color ?? Colors.black;
    
    setState(() {});
  }
}
