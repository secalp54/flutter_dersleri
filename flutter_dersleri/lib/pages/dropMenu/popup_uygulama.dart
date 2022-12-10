import 'package:flutter/material.dart';

class PopupOrnek extends StatefulWidget {
  PopupOrnek({Key? key}) : super(key: key);

  @override
  State<PopupOrnek> createState() => _PopupOrnekState();
}

class _PopupOrnekState extends State<PopupOrnek> {
  Color _secilenRenk = Colors.black;
  final String _title = "Renk Uygluması";
  List<RenkModel> popupMenuList = [
    RenkModel("Sarı", Colors.yellow),
    RenkModel("Kırmızı", Colors.red),
    RenkModel("Siyah", Colors.black),
    RenkModel("Yeşil", Colors.green)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: Text(_title,style: TextStyle(color: _secilenRenk),),
        actions: [
          PopupMenuButton(itemBuilder: ((context) {
            return popupMenuList
                .map((e) => PopupMenuItem(
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: e.renk,
                              child: Container(
                                height: 20,
                                width: 20,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(e.renkAdi),
                        ],
                      ),
                      onTap: () {
                        setState(() {});
                        _secilenRenk = e.renk;
                      },
                    ))
                .toList();
          }))
        ],
      ),
      body: Center(
        child: Text(
          "ADAPAZARI",
          style: TextStyle(fontSize: 50, color: _secilenRenk),
        ),
      ),
    );
  }
}

class RenkModel {
  final String renkAdi;
  final Color renk;

  RenkModel(this.renkAdi, this.renk);
}
