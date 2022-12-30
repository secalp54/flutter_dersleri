import 'package:flutter/material.dart';
import 'package:flutter_dersleri/core/random_num.dart';

class GridViewx extends StatefulWidget {
  @override
  State<GridViewx> createState() => _GridViewxState();
}

class _GridViewxState extends State<GridViewx> {
  List<NumberModal> _number = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Builder(builder: (context) {
          debugPrint(_number.length.toString());
          return Column(
            children: [
              SizedBox(
                height: 500,
                child: GridView.builder(
                  itemCount: 9,
                  //scrollDirection: Axis.vertical,
                  primary: true,
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _number[index].size = 25;
                        setState(() {
                          
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(1),
                        color: Colors.amber[100 * (index % 8 + 1)],
                        child: Center(
                            child: Text(
                          _number.isNotEmpty ? _number[index].value.toString() : "",
                          style: TextStyle(fontSize: _number.isNotEmpty ? _number[index].size.toDouble() : 0),
                        )),
                      ),
                    );
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {});
                    _number = RandomNumber().randomFill(9);
                    //debugPrint(number[2].value.toString());
                  },
                  child: const Text("Dağıt"))
            ],
          );
        }));
  }
}
