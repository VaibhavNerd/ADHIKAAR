import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFview extends StatefulWidget {
  const PDFview({Key key}) : super(key: key);

  @override
  State<PDFview> createState() => _PDFviewState();
}

class _PDFviewState extends State<PDFview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SfPdfViewer.network(
                'https://firebasestorage.googleapis.com/v0/b/ipr-filing.appspot.com/o/Journal_PDF%2FViewJournal.pdf?alt=media&token=66d3f745-e6d3-4d36-9d0b-ecc5055e4644',
                enableDocumentLinkAnnotation: false)));


  }
}
