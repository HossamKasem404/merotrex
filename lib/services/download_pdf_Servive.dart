import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ptow/main.dart';

class PdfService {
  final Dio _dio = Dio(
    BaseOptions(
      // بدّل بالبيس المناسب لبيئتك
      baseUrl: 'http://10.0.2.2:8000',
      responseType: ResponseType.bytes, // مهم لأنو الملف PDF (بايتات)
      followRedirects: false,
      validateStatus: (s) => s != null && s < 500,
      headers: {
        'Accept': 'application/pdf', // اختياري بس لطيف
      },
    ),
  );

  /// id: رقم التقرير, token: Bearer Token
  Future<void> downloadAndOpenPdf({
    required int id,
    // required String token,
    required BuildContext context,
  }) async {
    try {
      final res = await _dio.get(
        '/api/user/downloadPdf/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        onReceiveProgress: (r, t) {
          if (t > 0) {
            final p = (r / t * 100).toStringAsFixed(0);
            debugPrint('Downloading PDF: $p%');
          }
        },
      );

      if (res.statusCode == 200 && res.data is List<int>) {
        // 1) استخرج اسم الملف من الهيدر
        String fileName = 'report-$id.pdf';
        final dispo = res.headers['content-disposition']?.join(';') ?? '';
        final m = RegExp(r'filename="?([^"]+)"?').firstMatch(dispo);
        if (m != null) fileName = m.group(1)!;

        // 2) احفظ الملف ضمن مجلد التطبيق
        final dir = await getApplicationDocumentsDirectory();
        final file = File('${dir.path}/$fileName');
        await file.writeAsBytes(res.data as List<int>, flush: true);

        // 3) افتح الملف بتطبيق PDF على الجهاز
        await OpenFilex.open(file.path);

        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Downloaded successfully: $fileName')));
        }
      } else {
        // API عندك بيرجع JSON بالحالات الخطأ -> جرّب تقرأها كنص
        final msg = 'Download failed (${res.statusCode}).';
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(msg)));
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('ُError: $e')));
      }
    }
  }
}
