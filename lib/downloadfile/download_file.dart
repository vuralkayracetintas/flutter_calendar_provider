import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DownloadFile extends StatelessWidget {
  const DownloadFile({super.key});

  @override
  Widget build(BuildContext context) {
    final String pdfPath = '';
    Future<void> downloadPdf() async {
      final response = await http.get(Uri.parse(pdfPath));



      if(response.statusCode == 200){}
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  //
                },
                child: const Text('Download File ')),
          ],
        ),
      ),
    );
  }
}
