import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfWidget extends StatelessWidget {
  final bool isMe;
  final File? pdfFile;

  const PdfWidget({super.key, required this.isMe, this.pdfFile});

  Future<String> getFileSize() async {
    // Get the file size in bytes
    int fileSizeInBytes = await pdfFile!.length();
    
    // Convert the size to KB or MB
    double fileSizeInKB = fileSizeInBytes / 1024;
    double fileSizeInMB = fileSizeInKB / 1024;

    // Return formatted size
    if (fileSizeInMB >= 1) {
      return '${fileSizeInMB.toStringAsFixed(2)} MB';
    } else {
      return '${fileSizeInKB.toStringAsFixed(2)} KB';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => Get.to(PDFViewerScreen(file: pdfFile!,)),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isMe ? AppColor.chatSend : AppColor.chatRecive,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.picture_as_pdf,
                      color: AppColor.white,
                    ),
                  ),
                ),
                Constants.kWidth10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      pdfFile!.path.split('/').last,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    FutureBuilder<String>(
                      future: getFileSize(), // Fetch file size
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Text('Calculating...', style: TextStyle(fontSize: 12));
                        } else if (snapshot.hasError) {
                          return const Text('Error', style: TextStyle(fontSize: 12));
                        } else {
                          return Text(snapshot.data!, style: const TextStyle(fontSize: 12));
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PDFViewerScreen extends StatelessWidget {
  final File file;

  const PDFViewerScreen({required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("View PDF")),
      body:SfPdfViewer.asset(file.path)
    );
  }
}
