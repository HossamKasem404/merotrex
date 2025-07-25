import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ptow/Pages/Login_Page.dart';
import 'package:ptow/main.dart';

Future LogOut_Service(BuildContext context) async {
  http.Response response = await http.get(
    Uri.parse("$url/user/logout"),
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    },
  );
  if (response.statusCode == 200) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Login_Page()));
  } else {
    throw Exception(" there is an error");
  }
}
