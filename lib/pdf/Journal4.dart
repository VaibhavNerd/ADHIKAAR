import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFview4 extends StatefulWidget {
  const PDFview4({Key key}) : super(key: key);

  @override
  State<PDFview4> createState() => _PDFview4State();
}

class _PDFview4State extends State<PDFview4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SfPdfViewer.network(
                'https://firebasestorage.googleapis.com/v0/b/ipr-filing.appspot.com/o/Journal_PDF%2FViewJournal%20(3).pdf?alt=media&token=bfba00ff-797d-4559-b738-42fc816a3d6c',
                enableDocumentLinkAnnotation: false)));


  }
}
