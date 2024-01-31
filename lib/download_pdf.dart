import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DirectoryPath {
  getPath() async {
    final Directory tempDir = await getApplicationSupportDirectory();
    final filePath = Directory("${tempDir.path}");
    if (await filePath.exists()) {
      return filePath.path;
    } else {
      await filePath.create(recursive: true);
      return filePath.path;
    }
  }
}

class FileList extends StatefulWidget {
  FileList({super.key});

  @override
  State<FileList> createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  @override
  Widget build(BuildContext context) {
    List<int>? documentBytes;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  if (documentBytes != null) {
                    final Directory directory =
                        await getApplicationSupportDirectory();
                    final File file = File(directory.path + 'downloaded.pdf');
                    await file
                        .writeAsBytes(documentBytes!, flush: true)
                        .whenComplete(() {
                      OpenFile.open(directory.path + 'downloaded.pdf');
                    });
                    print('asdasdsd');
                  } else {
                    print('bbbbb');
                  }
                },
                icon: const Icon(Icons.download))
          ],
        ),
        body: SfPdfViewer.network(
          'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
          onDocumentLoaded: (details) async {
            documentBytes = await details.document.save();
          },
        ));
  }
}
