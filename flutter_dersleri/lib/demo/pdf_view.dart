import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfView extends StatefulWidget {
  const PdfView({Key? key}) : super(key: key);

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  final bool _isLoading = false;
  int _page = 0;
  final StreamController<String> _pageCountController = StreamController<String>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _isLoading
            ? const CircleAvatar()
            : Center(
                child: PDF(
                    swipeHorizontal: true,
                    defaultPage: 3,
                    onPageChanged: (int? current, int? total) {
                      _pageCountController.add(current.toString());
                      _page = current ?? 0;
                      debugPrint(_page.toString());
                    }).cachedFromUrl(
                  'https://adamat.hem-soft.com/data/nagihan.pdf',
                  maxAgeCacheObject: Duration(days: 30), //duration of cache
                  placeholder: (progress) => Center(child: Text('$progress %')),
                  errorWidget: (error) => Center(child: Text(error.toString())),
                ),
              ),
      ),
    );
  }

  // Future<void> loadDocument() async {
  //   _doc = await PDFDocument.fromURL('http://adapazari.meb.gov.tr/meb_iys_dosyalar/2022_11/23144750_5._ADAMAT_SYnav_Takvimi.pdf');
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }
}
