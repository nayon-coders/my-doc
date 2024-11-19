//Routing with url and with send object into encoding. 

void openPreparationNewTab(BuildContext context, Map<String, dynamic> data,) {
  if (kIsWeb) {
    // Encode the data as part of the URL
    final encodedData = Uri.encodeComponent(jsonEncode(data));
    final url = 'assets/invoice/export-preparation/index.html?data=$encodedData'; // Point to your web page
    html.window.open(url, '_blank'); // Open in a new tab
  } else {
    // Use regular navigation for non-web platforms
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExportPreparWebVIew(jsonData: data),
      ),
    );
  }
}


//view.dart: 
//////////////////////////////
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

/// For web-specific imports
import 'dart:html' as html;
import 'dart:ui_web' as ui_web; // New import for all web-only stuff...

class ExportPreparWebVIew extends StatelessWidget {
  final Map<String, dynamic> jsonData;

  const ExportPreparWebVIew({required this.jsonData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final encodedData = Uri.encodeComponent(jsonEncode(jsonData));
    final iframeUrl = 'assets/invoice/export-preparation/index.html?data=$encodedData';

    if (kIsWeb) {
      // Register the iframe only for web
      ui_web.platformViewRegistry.registerViewFactory(
        'iframe-view',
            (int viewId) => html.IFrameElement()
          ..src = iframeUrl
          ..style.border = 'none',
      );

      // Return the iframe widget
      return Scaffold(
        appBar: AppBar(title: const Text("Web Example")),
        body: HtmlElementView(viewType: 'iframe-view'),
      );
    } else {
      // Fallback for unsupported platforms
      return Scaffold(
        appBar: AppBar(title: const Text("Unsupported Platform")),
        body: const Center(
          child: Text("This functionality is only available on the web."),
        ),
      );
    }
  }
}
/////////

আপনার html css javascript ফাইলগুলো assets ফোল্ডার এ রাখেন। 
