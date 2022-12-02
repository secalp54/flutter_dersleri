
import 'package:flutter/material.dart';

class ContainerUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: customColumn());
    ;
  }

  Column customColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [kutuOlustur("A"), kutuOlustur("D"), kutuOlustur("A")],
        ),
        kutuOlustur("D"),
        kutuOlustur("A"),
        kutuOlustur("P"),
        kutuOlustur("A"),
        kutuOlustur("Z"),
        kutuOlustur("A"),
        kutuOlustur("R"),
        kutuOlustur("I"),
      ],
    );
  }

  Container kutuOlustur(String s) {
    return Container(
      color: Colors.amber,
      width: 50,
      height: 50,
      child: Text(s),
    );
  }
}
