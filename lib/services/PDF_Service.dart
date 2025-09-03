import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ptow/Models/PDF_Model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:ptow/main.dart';

class Pdf_Service {
  Future<dynamic> getPdfAnalysis({
    int? id,
    required dynamic pdf,
    required BuildContext context,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://10.0.2.2:8000/api/user/analyzeCbc"),
    );

    if (id != null) {
      // request.fields["family_member_id"] = id.toString();
      request.fields.addAll({'family_member_id': id.toString()});
    }
    if (pdf != null) {
      request.files.add(await http.MultipartFile.fromPath('file', pdf.path));
    }

    if (pdf != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          pdf.path,
          contentType: MediaType('application', 'pdf'),
        ),
      );
    }

    request.headers.addAll({
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseData = jsonDecode(await response.stream.bytesToString());
      print("نجح جلب البيانات ");
      dynamic data = responseData["record"];
      print(data);
      // Navigator.pop(context);
      Navigator.pop(context, true);
      RecordModel analysisModel = RecordModel.fromJson(responseData);
      return analysisModel;
    } else {
      String errorResponse = await response.stream.bytesToString();
      Map<String, dynamic> errorData = jsonDecode(errorResponse);
      print("خطأ ❌: $errorData");

      if (errorData.containsKey("message")) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorData["message"].toString())),
        );
      }
    }
  }
}
