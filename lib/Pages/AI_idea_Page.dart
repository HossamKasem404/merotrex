import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AiIdea_Page extends StatelessWidget {
  static String id = "AiIdea_Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF244476),
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.medical_services, color: Colors.white),
            Spacer(),
            Text('A1', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'AI Diagnosis',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),

            // Description
            Text(
              'Upload blood test report to analyse potential issues.',
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            SizedBox(height: 24),

            // Upload button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );

                  if (result != null) {
                    String filePath = result.files.single.path!;
                    print('Selected PDF path: $filePath');

                    // هنا يمكنك معالجة الملف أو رفعه للسيرفر
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('PDF selected: $filePath')),
                    );
                  } else {
                    print('No file selected.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF244476),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Upload PDF',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 32),

            // Suggestions Section
            Text(
              'Suggestions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Anemia detected. Consider measuring iron levels.',
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
