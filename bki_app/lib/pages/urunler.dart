import 'package:bki_app/modals/urun_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class UrunListele extends StatefulWidget {
  UrunListele({Key? key}) : super(key: key);

  @override
  State<UrunListele> createState() => _UrunListeleState();
}

class _UrunListeleState extends State<UrunListele> {
  late Future<List<UrunModal>> _myList;
  var autoList = <UrunModal>[];
  @override
  void initState() {
    super.initState();
    _myList = _verileriAl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton: FloatingActionButton(onPressed: (){
 final Uri url = Uri.parse('sms:5054774294');
      _launchUrl(url);
    },child: Text("Call"),),
     appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,title: Text("My Shoping",style: GoogleFonts.abel(fontSize: 25,color:Colors.black),),),
      body: Column(
        children: [
            Padding(
              padding: const EdgeInsets.only(bottom:20 ),
              child: SizedBox(
               height: 50,
               width: MediaQuery.of(context).size.width-25,
               child: Center(child: autoComplate())),
            ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height - 10,
              child: FutureBuilder(
                  future: _myList,
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
                                ClipRRect(
                                 borderRadius: BorderRadius.circular(20),
                                  child:SizedBox(
                                    height: 250,
                                    child: FadeInImage(
                                     
                                     image: NetworkImage(urun.thumbnail!), placeholder: AssetImage("assets/img/loading.gif"),
                                ),
                                  )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(urun.title!,style: GoogleFonts.montserrat(fontSize: 20),),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(urun.description!,style: GoogleFonts.montserrat(fontSize: 14),),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 55,
                                        height: 30,
                                        child: Image.asset("assets/img/"+(urun.rating??1).round().toString()+".png")),
                                      Text(urun.price!.toString() + " ₺", style: GoogleFonts.firaSansExtraCondensed(color: Colors.orange,fontSize: 20),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("İnternet bağlantınız arızalı olabilir.");
                    } else
                      return Center(child: CircularProgressIndicator());
                  })),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    //
  }
}
  Autocomplete<UrunModal> autoComplate() {
    return Autocomplete<UrunModal>(
      onSelected: (option) {
        print("${option.category} tıklandı");
      },
      optionsBuilder: ((value) {
        if (value.text.isEmpty) {
          return [];
        }
        return autoList.where((element) => element.title!.toLowerCase().contains(value.text.toLowerCase()));
      }),
      fieldViewBuilder: ((context, textEditingController, focusNode, onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          
          onSubmitted: ((value) async {
            print(value + "seçildi"); 
            _myList = _verileriAl();
            if (!value.isEmpty) {
            
              var result = <UrunModal>[];
              result = await _myList;
              _myList = Future.value(
                  result.where((element) => element.title!.toLowerCase().contains(value.toLowerCase())).toList());
              print("object");
              setState(() {});
            }
            focusNode.unfocus();
          }),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText:"Arama",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        );
      }),
    );
  }

  Future<List<UrunModal>> _verileriAl() async {
    String path = "https://dummyjson.com/products";
    //await Future.delayed(Duration(seconds: 5));
    var response = await Dio().get(path);

    var data = (response.data as Map);
    var result = (data["products"] as List).map((urun) => UrunModal.fromJson(urun)).toList();
    setState(() {
      autoList = result;
    });
    return result;
  }
}
