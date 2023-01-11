
import 'package:peroson_app/data/veri.dart';

import '../modals/personel_modal.dart';

class ServiceWebFake{

   
    Future<List<PersonelModel>>  getPersonelListesi()async{
    await Future.delayed(Duration(seconds: 3));
    return PersonelData().data.map((e) => PersonelModel.fromJson(e)).toList();
    } 
   
}