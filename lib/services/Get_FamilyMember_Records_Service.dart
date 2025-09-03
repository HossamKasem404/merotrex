import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ptow/Models/Famely_Members_Records_Model.dart';
import 'package:ptow/main.dart';

class Get_FamilyMember_Records_Service {
  Future<dynamic> get_Family_Member_analysis(
    int memberId,
    BuildContext context,
  ) async {
    try {
      final response = await http.get(
        Uri.parse("$url/user/getrecordsformyfamilymembers/$memberId"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("Raw Response: $responseData");
        return Famely_Members_Records_Model.fromJson(responseData);
      } else {
        print("Error Body: ${response.body}");
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
