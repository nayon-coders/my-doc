#routing 
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
