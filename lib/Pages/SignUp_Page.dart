import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ptow/Pages/Login_Page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptow/Widget/buttonWidget.dart';
import 'package:ptow/services/SignUp_Service.dart';

class SignUp_Page extends StatefulWidget {
  static String id = "Signup";
  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  File? photo;
  // getImage() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) {
  //     return;
  //   }
  //   final imageTemporary = File(image.path);
  //   setState(() {
  //     photo = imageTemporary;
  //   });
  // }
  getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      photo = imageTemporary;
    });
  }

  // getImageCamera() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (image == null) {
  //     return;
  //   }

  //   final imageTemporary = File(image.path);
  //   setState(() {
  //     photo = imageTemporary;
  //   });
  // }
  getImageCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      photo = imageTemporary;
    });
  }

  final _formField = GlobalKey<FormState>();
  final firstName_Controller = TextEditingController();
  final lastName_Controller = TextEditingController();
  final Gender_Controller = TextEditingController();
  final date_of_birth_Controller = TextEditingController();
  final email_Controller = TextEditingController();
  final password_Controller = TextEditingController();
  final confirmPassword_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.local_hospital, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Welcom In Your Clinic',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      // key: _formField,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formField,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 24),

                  // Icon
                  Image(image: AssetImage('assets/logo.png')),

                  SizedBox(height: 16),

                  // Login text
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),

                  SizedBox(height: 32),

                  Text(
                    'Please enter this informatios:',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),

                  //First Name
                  TextField(
                    controller: firstName_Controller,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      prefixIcon: Icon(Icons.person_2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  //second Name
                  TextField(
                    controller: lastName_Controller,
                    decoration: InputDecoration(
                      hintText: 'second Name',
                      prefixIcon: Icon(Icons.person_2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Gender
                  TextField(
                    controller: Gender_Controller,
                    decoration: InputDecoration(
                      hintText: 'Gender',
                      prefixIcon: Icon(Icons.male),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  const Positioned(
                    top: 450,
                    left: 30,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Add Your  photo",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 480,
                    left: 30,
                    right: 30,
                    child: Stack(
                      children: [
                        photo != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 15,
                                    top: 10,
                                  ),
                                  width: 400,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black12,
                                    image: DecorationImage(
                                      image: FileImage(photo!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 15,
                                    top: 10,
                                  ),
                                  width: 400,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: const DecorationImage(
                                      image: AssetImage(""),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 680,
                    left: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          onTap: getImage,
                          height: 50,
                          width: 150,
                          color: Colors.black,
                          text: "Use Gallery",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ButtonWidget(
                            onTap: getImageCamera,
                            height: 50,
                            width: 150,
                            color: Colors.black,
                            text: "UseCamera",
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),

                  // Gender
                  TextField(
                    controller: date_of_birth_Controller,
                    decoration: InputDecoration(
                      hintText: 'year-month-day',
                      prefixIcon: Icon(Icons.male),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Email
                  TextField(
                    controller: email_Controller,
                    decoration: InputDecoration(
                      hintText: 'Your Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Password
                  TextField(
                    controller: password_Controller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  //verify Password
                  TextField(
                    controller: confirmPassword_Controller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Verify Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // Login button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formField.currentState!.validate()) {
                          Signup_Service().registerAnAccountServices(
                            Firstname: firstName_Controller.text,
                            Lastname: lastName_Controller.text,
                            gender: Gender_Controller.text,
                            photo: photo,

                            date_of_birth: date_of_birth_Controller.text,
                            email: email_Controller.text,
                            password: password_Controller.text,
                            password_confirmation:
                                confirmPassword_Controller.text,
                            context: context,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Row(
                    children: [
                      Text(
                        'Do you have an account? >> please login',
                        style: TextStyle(color: Colors.black),
                      ),

                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Login_Page()),
                          );
                        },
                        label: Text('here.'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
