import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFview6 extends StatefulWidget {
  const PDFview6({Key key}) : super(key: key);

  @override
  State<PDFview6> createState() => _PDFview6State();
}

class _PDFview6State extends State<PDFview6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SfPdfViewer.network(
                'https://firebasestorage.googleapis.com/v0/b/ipr-filing.appspot.com/o/Journal_PDF%2FViewJournal%20(5).pdf?alt=media&token=4d48b210-a40c-4b02-9f9d-642803b4db2f',
                enableDocumentLinkAnnotation: false)));


  }
}
