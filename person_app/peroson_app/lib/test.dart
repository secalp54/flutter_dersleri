import 'package:flutter/material.dart';
import 'package:peroson_app/sayfalar/liste_sayfa.dart';

class TestDemo extends StatefulWidget {
  TestDemo({Key? key}) : super(key: key);

  @override
  State<TestDemo> createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  @override
  void initState() {
    print("initstate");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didchange satate");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant TestDemo oldWidget) {
    
    super.didUpdateWidget(oldWidget);
    print("didupdatewidget");
  }

  int s = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: (() {
              
            }),
            child: Text("tikla")),
      ),
    );
  }
}
