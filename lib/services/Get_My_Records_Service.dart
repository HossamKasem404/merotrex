import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ptow/Models/My_Records_Model.dart';
import 'package:ptow/main.dart';

class Get_My_Records_Service {
  Future<My_Records_Model> get_my_analysis() async {
    try {
      final response = await http.get(
        Uri.parse("$url/user/getrecordsforme"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(" $responseData");

        return My_Records_Model.fromJson(responseData);
      } else {
        throw Exception(" Error: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
