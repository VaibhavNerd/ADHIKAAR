import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFview2 extends StatefulWidget {
  const PDFview2({Key key}) : super(key: key);

  @override
  State<PDFview2> createState() => _PDFview2State();
}

class _PDFview2State extends State<PDFview2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SfPdfViewer.network(
                'https://firebasestorage.googleapis.com/v0/b/ipr-filing.appspot.com/o/Journal_PDF%2FViewJournal%20(1).pdf?alt=media&token=2ae5e0cb-9c4f-4325-8669-b58123bba3a7',
                enableDocumentLinkAnnotation: false)));


  }
}
