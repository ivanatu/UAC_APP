import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '/models/newz_model.dart';
import '/exports/exports.dart';

class NewsDetails extends StatefulWidget {
  final Datum newz;
  const NewsDetails({super.key, required this.newz});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey =
      GlobalKey<SfPdfViewerState>();
  var pdfController = PdfViewerController();
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black12,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Apis.url + widget.newz.attributes.pdf.data.attributes.url);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newz.attributes.title),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade50,
      body: SfPdfViewer.network(
        Apis.url + widget.newz.attributes.pdf.data.attributes.url,
        // 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        key: _pdfViewerKey,
        controller: pdfController,
      ),
    );
  }
}
