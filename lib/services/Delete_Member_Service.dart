import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ptow/main.dart';

class Delete_Member_Service {
  Future deleteMember(int memberId, BuildContext context, String token) async {
    try {
      final response = await http.delete(
        Uri.parse('$url/user/deletemember/$memberId'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final message = responseData["Message"];

        Future.microtask(() {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('$message')));
        });
      }
    } catch (e) {
      Future.microtask(() {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('ُError')));
      });
    }
  }
}
