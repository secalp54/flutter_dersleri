import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:peroson_app/modals/personel_modal.dart';

class PersonelDetay extends StatefulWidget {
  PersonelDetay({Key? key, required this.personel}) : super(key: key);
  final PersonelModel personel;

  @override
  State<PersonelDetay> createState() => _PersonelDetayState();
}

class _PersonelDetayState extends State<PersonelDetay> {
  PaletteGenerator? paletteGenerator;
  Color? _appColor = Colors.red;
  @override //! bu init state widget ilk çalıştığında çalışr ve işi biter
  void initState() {
    // TODO: implement initState
    super.initState();
    _updatePaletGenerator();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: _appColor,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(widget.personel.foto!),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Card(
            child: ListTile(
              trailing: Icon(Icons.person),
              title: Text(widget.personel.adiSoyadi!),
              subtitle: Text(widget.personel.cinsiyet!),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Icon(Icons.engineering),
              title: Text(widget.personel.isKategorisi!),
              subtitle: Text(widget.personel.departman!),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Icon(Icons.flag),
              title: Text(widget.personel.sirket!),
              subtitle: Text(widget.personel.ulke!),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Icon(Icons.mail),
              title: Text(widget.personel.mezunOkul!),
              subtitle: Text(widget.personel.email!),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Icon(Icons.phone),
              title: Text(widget.personel.telefon!),
              subtitle: Text(widget.personel.bilgi! * 100),
            ),
          ),
        ]))
      ],
    );
  }

  _updatePaletGenerator() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(NetworkImage(widget.personel.foto!));
    _appColor = paletteGenerator?.dominantColor?.color ?? Colors.red;
    setState(() {
      
    });
  }
}
