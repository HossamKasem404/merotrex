import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ptow/Models/Add_FamilyMember_Model.dart';
import 'package:ptow/main.dart';

class AddFamilyMemberService {
  Future<dynamic> addFamilyMember({
    required String fullName,
    required String date_of_birth,
    required String gender,
    required String relation,
    required dynamic photo, // هذا المتغير يجب أن يحتوي على ملف صورة (File)
    required BuildContext context,
  }) async {
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
      request.files.add(await http.MultipartFile.fromPath('photo', photo.path));
    }

    request.headers.addAll({
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseData = jsonDecode(await response.stream.bytesToString());

      FamilyMember_Models model = FamilyMember_Models.fromJson(responseData);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(model.message)));

      Navigator.pop(context);

      return model;
    } else if (response.statusCode == 422) {
      String errorResponse = await response.stream.bytesToString();
      Map<String, dynamic> errorData = jsonDecode(errorResponse);
      if (errorData.containsKey("errors")) {
        dynamic message = errorData["message"];
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$message')));
      }
    }
  }
}
