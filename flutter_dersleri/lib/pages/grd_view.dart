import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              EasyLoading.showToast("Bir kere tıklandı");
            },
            onDoubleTap: (() => EasyLoading.showToast("iki kere tıklandı")),
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              color: Colors.amber,
            ),
          );
        }),
      ),
    );
  }

  Column govdeBolumu() {
    return Column(
      children: [
        Text("Başlık"),
        Container(
          height: 500,
          child: myGrid(),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Tamam"))
      ],
    );
  }

  GridView myGrid() {
    return GridView.count(
      scrollDirection: Axis.vertical,
      primary: true,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 2,
      mainAxisSpacing: 5,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("He'd have you all unravel at the"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: const Text('Heed not the rabble'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
          child: const Text('Sound of screams but the'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[400],
          child: const Text('Who scream'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const Text('Revolution is coming...'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const Text('Revolution, they...'),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.teal[400], borderRadius: BorderRadius.circular(50)),
          padding: const EdgeInsets.all(8),
          child: Center(child: const Text('Who scream')),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const Text('Revolution is coming...'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const Text('Revolution, they...'),
        ),
      ],
    );
  }
}
