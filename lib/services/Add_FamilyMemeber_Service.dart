import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ptow/Models/Add_FamilyMember_Model.dart';
import 'package:ptow/main.dart';

class AddFamilyMemberService {
  Future<Add_FamilyMember_Model> addFamilyMember({
    required String fullName,
    required String date_of_birth,
    required String gender,
    required String relation,
    required dynamic photo, // هذا المتغير يجب أن يحتوي على ملف صورة (File)
    required BuildContext context,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("http://10.0.2.2:8000/api/user/addmember"),
      );

      request.fields.addAll({
        'Full_Name': fullName,
        'date_of_birth': date_of_birth,
        'gender': gender,
        'relation': relation,
      });

      if (photo != null) {
        request.files.add(
          await http.MultipartFile.fromPath('photo', photo.path),
        );
      }

      request.headers.addAll({
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(await response.stream.bytesToString());

        Add_FamilyMember_Model model = Add_FamilyMember_Model.fromJson(
          responseData,
        );

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(model.message)));

        Navigator.pop(context); // الرجوع بعد الإضافة

        return model;
      } else if (response.statusCode == 422) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('تحقق من الحقول المدخلة')));
        throw Exception("Validation error");
      } else {
        throw Exception("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred while adding family member: $e");
    }
  }
}
