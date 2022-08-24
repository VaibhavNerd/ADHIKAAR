import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFview3 extends StatefulWidget {
  const PDFview3({Key key}) : super(key: key);

  @override
  State<PDFview3> createState() => _PDFview3State();
}

class _PDFview3State extends State<PDFview3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SfPdfViewer.network(
                'https://firebasestorage.googleapis.com/v0/b/ipr-filing.appspot.com/o/Journal_PDF%2FViewJournal%20(2).pdf?alt=media&token=223aa761-5ee6-494f-bcb3-28a59490aa1b',
                enableDocumentLinkAnnotation: false)));


  }
}
