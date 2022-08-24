import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFview7 extends StatefulWidget {
  const PDFview7({Key key}) : super(key: key);

  @override
  State<PDFview7> createState() => _PDFview7State();
}

class _PDFview7State extends State<PDFview7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SfPdfViewer.network(
                'https://firebasestorage.googleapis.com/v0/b/ipr-filing.appspot.com/o/Journal_PDF%2FViewJournal%20(6).pdf?alt=media&token=72ba33d9-bc7e-46ca-8eed-77aa365ab759',
                enableDocumentLinkAnnotation: false)));


  }
}
