import 'package:bki_app/modals/kitap_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  CardItem({Key? key, required this.kitapModal}) : super(key: key);
  final KitapModal kitapModal;
  @override
  Widget build(BuildContext context) {
    var _kitap = kitapModal;
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          //Resim yeri
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.amber,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.h),
                child: Image.network(
                  _kitap.image!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //kitap bilgi yerleri
          Expanded(
            flex: 3,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        _kitap.title!.length > 24 ? _kitap.title!.substring(0, 24) : _kitap.title!,
                        style: GoogleFonts.montserrat(fontSize: 32.sp),
                      ),
                    ),
                    Text(
                      _kitap.fiyat!,
                      style: GoogleFonts.montserrat(fontSize: 34.sp, color: Colors.amber),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          FlutterBackgroundService().invoke(
                            'update',
                            {
                              "current_date": "DAte here",
                              "device": "App",
                            },
                          );
                        },
                        child: Text("ok"))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
    ;
  }
}
