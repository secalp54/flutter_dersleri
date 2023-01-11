import 'package:bki_app/modals/urun_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UrunListele extends StatefulWidget {
  UrunListele({Key? key}) : super(key: key);

  @override
  State<UrunListele> createState() => _UrunListeleState();
}

class _UrunListeleState extends State<UrunListele> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: _verileriAl(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var urun = snapshot.data![index];
                  return Card(
                    child: Column(
                      children: [
                        SizedBox(child: Image.network(urun.thumbnail!,fit: BoxFit.contain, height: 250,width: 250,),),
                        SizedBox(height: 5,),
                        Text(urun.title!),
                        SizedBox(height: 5,),
                        Text(urun.price!.toString()+" ₺"),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("İnternet bağlantınız arızalı olabilir.");
            } else
              return Center(
                  child: LottieBuilder.network("https://assets5.lottiefiles.com/packages/lf20_jlvnuab1.json"));
          })),
    );
  }

  Future<List<UrunModal>> _verileriAl() async {
    String path = "https://dummyjson.com/products";
    //await Future.delayed(Duration(seconds: 5));
    var response = await Dio().get(path);

    var data = (response.data as Map);
    return (data["products"] as List).map((urun) => UrunModal.fromJson(urun)).toList();
  }
}
