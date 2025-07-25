import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ptow/main.dart';
import 'package:ptow/Models/Add_FamilyMember_Model.dart';

class GetFamilyMembersService {
  Future<FamilyDataModel?> getFamilyMembers() async {
    try {
      final response = await http.get(
        Uri.parse("http://10.0.2.2:8000/api/user/getMembers"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(" $responseData");

        return FamilyDataModel.fromJson(responseData);
      } else {
        throw Exception(" Error: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
