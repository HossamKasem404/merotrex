// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:ptow/main.dart';

// class AddFamilyMemberService {
//   Future<dynamic> addFamilyMember({
//     required String fullName,
//     required String date_of_birth,
//     required String gender,
//     required String relation,
//     required dynamic photo, // هذا المتغير يجب أن يحتوي على ملف صورة (File)
//     required BuildContext context,
//   }) async {
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse("http://10.0.2.2:8000/api/user/addmember"),
//     );

//     request.fields.addAll({
//       'Full_Name': fullName,
//       'date_of_birth': date_of_birth,
//       'gender': gender,
//       'relation': relation,
//     });

//     if (photo != null) {
//       request.files.add(await http.MultipartFile.fromPath('photo', photo.path));
//     }

//     request.headers.addAll({
//       "Accept": "application/json",
//       "Authorization": "Bearer $token",
//     });

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       // final responseData = jsonDecode(await response.stream.bytesToString());

//       // FamilyMember_Models model = FamilyMember_Models.fromJson(responseData);

//       // ScaffoldMessenger.of(
//       //   context,
//       // ).showSnackBar(SnackBar(content: Text(model.message)));

//       Navigator.pop(context);

//       // return model;
//     } else if (response.statusCode == 422) {
//       String errorResponse = await response.stream.bytesToString();
//       Map<String, dynamic> errorData = jsonDecode(errorResponse);
//       if (errorData.containsKey("errors")) {
//         dynamic message = errorData["message"];
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text('$message')));
//       }
//     }
//   }
// }
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ptow/main.dart';

class AddFamilyMemberService {
  Future<dynamic> addFamilyMember({
    required String fullName,
    required String date_of_birth,
    required String gender,
    required String relation,
    required Uint8List? photo, // صورة من نوع Uint8List للويب
    required BuildContext context,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("$url/user/addmember"),
    );

    request.fields.addAll({
      'Full_Name': fullName,
      'date_of_birth': date_of_birth,
      'gender': gender,
      'relation': relation,
    });

    // ✅ رفع الصورة للويب
    if (photo != null) {
      request.files.add(
        http.MultipartFile.fromBytes('photo', photo, filename: "upload.jpg"),
      );
    }

    request.headers.addAll({
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      Navigator.pop(context, true);
    } else if (response.statusCode == 422) {
      print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      String errorResponse = await response.stream.bytesToString();
      Map<String, dynamic> errorData = jsonDecode(errorResponse);
      if (errorData.containsKey("errors")) {
        dynamic message = errorData["message"];
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$message')));
      }
    } else {
      print("YYYYYYYYYYYYYYYYYYYYYYYYYYYY");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${response.statusCode}')));
    }
  }
}
