import 'package:flutter/material.dart';
import 'package:ptow/services/download_pdf_Servive.dart';

class Analysis_Details extends StatelessWidget {
  final int id;
  final String? disease;
  final String? diagnosis;
  final String? suggested_doctor;
  final String? urgency;
  final double? model_confidence;
  final String? analyzed_at;
  const Analysis_Details({
    super.key,
    required this.id,
    this.disease,
    this.diagnosis,
    this.suggested_doctor,
    this.urgency,
    this.model_confidence,
    this.analyzed_at,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF2D6),

      appBar: AppBar(
        title: const Text(
          "Analysis result",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF244476),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // العنوان (المرض)
                Text(
                  "$disease",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 10),

                // التشخيص
                Text(
                  '$diagnosis',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.5),
                ),

                const SizedBox(height: 20),

                // نوع الفحص و الطبيب المقترح
                Row(
                  children: [
                    Chip(
                      avatar: const Icon(Icons.science, size: 18),
                      label: const Text("CBC"),
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      avatar: const Icon(Icons.local_hospital, size: 18),
                      label: Text("$suggested_doctor"),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // مستوى الإلحاح
                Chip(
                  avatar: const Icon(
                    Icons.priority_high,
                    color: Colors.white,
                    size: 18,
                  ),
                  label: Text(
                    "Urgency:$urgency ",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.orange,
                ),

                const SizedBox(height: 16),

                // ثقة النموذج
                Text(
                  "Model confidence: ${model_confidence! * 100}%",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: model_confidence,
                    minHeight: 10,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 20),

                // تاريخ التحليل
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 18),
                    SizedBox(width: 6),
                    Text("Analysis date: $analyzed_at"),
                  ],
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    await PdfService().downloadAndOpenPdf(
                      id: id,
                      context: context,
                    );
                  },
                  child: const Text('PDF'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
