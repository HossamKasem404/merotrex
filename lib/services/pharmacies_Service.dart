import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ptow/Models/Pharmacies_Model.dart';
import 'package:ptow/main.dart';

class Get_Pharmacies_Service {
  Future<Pharmacies_Model?> getPharmacies() async {
    try {
      final response = await http.get(
        Uri.parse("$url/user/getph"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("Response: $responseData");

        return Pharmacies_Model.fromJson(responseData);
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
      rethrow;
    }
  }
}
