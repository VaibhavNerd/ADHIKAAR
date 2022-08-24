import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFview5 extends StatefulWidget {
  const PDFview5({Key key}) : super(key: key);

  @override
  State<PDFview5> createState() => _PDFview5State();
}

class _PDFview5State extends State<PDFview5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SfPdfViewer.network(
                'https://firebasestorage.googleapis.com/v0/b/ipr-filing.appspot.com/o/Journal_PDF%2FViewJournal%20(4).pdf?alt=media&token=851f9d2f-7484-4fa1-907d-b9ff9586b561',
                enableDocumentLinkAnnotation: false)));


  }
}
