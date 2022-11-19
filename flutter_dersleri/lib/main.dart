import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//stateFullWidget
//stateLessWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("button çalıştı");
          },
          child: Icon(Icons.add_a_photo),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(50),
            color: Colors.blue,
            height: 300,
            width: 300,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(30),
                color: Colors.yellowAccent,
                child: Icon(
                  Icons.save,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
