// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:ptow/Models/SignUp_Model.dart';
// import 'package:ptow/main.dart';

// class Signup_Service {
//   Future<SignUp_Model> registerAnAccountServices({
//     required String Firstname,
//     required String Lastname,
//     required dynamic photo,
//     required String gender,
//     required String date_of_birth,
//     required String email,
//     required String password,
//     required String password_confirmation,
//     required BuildContext context,
//   }) async {
//     try {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse("http://10.0.2.2:8000/api/user/register"),
//       );
//       request.fields.addAll({
//         "Firstname": Firstname,
//         "Lastname": Lastname,
//         "gender": gender,
//         // "photo": photo,
//         "date_of_birth": date_of_birth,
//         "email": email,
//         "password": password,
//         "password_confirmation": password_confirmation,
//       });
//       if (photo != null) {
//         request.files.add(
//           await http.MultipartFile.fromPath('photo', photo.path),
//         );
//       }

//       request.headers.addAll({
//         "Accept": "application/json",
//         "Content-Type": "application/json",
//       });
//       // var headers = {
//       //   "Accept": "application/json",
//       //   "Content-Type": "application/json",
//       // };
//       // request.files.add(await http.MultipartFile.fromPath('photo', photo.path));
//       // request.headers.addAll(headers);

//       http.StreamedResponse response = await request.send();

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var responseData = jsonDecode(await response.stream.bytesToString());
//         print("فات عالرد");

//         dynamic data = responseData['Data'];
//         print(data);
//         token = data["token"];
//         print("خزن التوكن");

//         Navigator.pushNamed(context, "Home_page");
//         SignUp_Model signUpModel = SignUp_Model.fromJson(responseData);

//         return signUpModel;
//       } else if (response.statusCode == 422) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(const SnackBar(content: Text('There Is Error')));
//         throw Exception("there is error");
//       } else {
//         throw Exception("Request failed with status: ${response.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("An error occurred during registration: $e");
//     }
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ptow/Models/SignUp_Model.dart';
import 'package:ptow/Pages/Home_Page.dart';
import 'package:ptow/main.dart';

class Signup_Service {
  Future<dynamic> registerAnAccountServices({
    required String Firstname,
    required String Lastname,
    required dynamic photo,
    required String gender,
    required String date_of_birth,
    required String email,
    required String password,
    required String password_confirmation,
    required BuildContext context,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://10.0.2.2:8000/api/user/register"),
    );

    request.fields.addAll({
      "Firstname": Firstname,
      "Lastname": Lastname,
      "gender": gender,
      "date_of_birth": date_of_birth,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
    });

    if (photo != null) {
      request.files.add(await http.MultipartFile.fromPath('photo', photo.path));
    }

    request.headers.addAll({"Accept": "application/json"});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = jsonDecode(await response.stream.bytesToString());
      print("فات عالرد");
      dynamic data = responseData['Data'];
      print(data);
      token = data["token"];
      print("خزن التوكن");
      Navigator.push(context, MaterialPageRoute(builder: (_) => Home_page()));
      SignUp_Model signUpModel = SignUp_Model.fromJson(responseData);
      return signUpModel;
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
