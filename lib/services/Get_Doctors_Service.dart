import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ptow/Models/Doctor_Model.dart';
import 'package:ptow/main.dart';

class Get_Doctors_Service {
  Future<Doctors_Model?> getdoctors() async {
    try {
      final response = await http.get(
        Uri.parse("$url/user/getdoc"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(" $responseData");

        return Doctors_Model.fromJson(responseData);
      } else {
        throw Exception(" Error: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
