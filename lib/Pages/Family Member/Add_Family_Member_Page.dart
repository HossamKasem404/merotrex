import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptow/services/Add_FamilyMemeber_Service.dart';

class Add_Family_Member_Page extends StatefulWidget {
  static String id = "AddFamilyMember";

  @override
  State<Add_Family_Member_Page> createState() => _Add_Family_Member_PageState();
}

class _Add_Family_Member_PageState extends State<Add_Family_Member_Page> {
  File? photo;

  final _formField = GlobalKey<FormState>();
  final Name_Controller = TextEditingController();
  final gender_Controller = TextEditingController();
  final date_of_birth_Controller = TextEditingController();
  final relation_Controller = TextEditingController();

  getImageCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      photo = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text("Add Family Member"),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formField,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Center(
                //   child: Text(
                //     'Add Family Member',
                //     style: TextStyle(
                //       fontSize: 24,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.blue[800],
                //     ),
                //   ),
                // ),
                const SizedBox(height: 24),

                //  Name
                TextField(
                  controller: Name_Controller,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Date of Birth
                TextField(
                  controller: date_of_birth_Controller,
                  decoration: InputDecoration(
                    hintText: 'year-month-day',
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Gender
                TextField(
                  controller: gender_Controller,
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    prefixIcon: Icon(Icons.male),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Relation
                TextField(
                  controller: relation_Controller,
                  decoration: InputDecoration(
                    hintText: 'Relation (e.g. Brother, Mother)',
                    prefixIcon: Icon(Icons.group),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  "Add a photo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                const SizedBox(height: 12),

                Center(
                  child: photo != null
                      ? Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: FileImage(photo!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.grey[600],
                          ),
                        ),
                ),

                const SizedBox(height: 16),

                Center(
                  child: ElevatedButton.icon(
                    onPressed: getImageCamera,
                    icon: Icon(Icons.camera),
                    label: Text("Use Camera"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formField.currentState!.validate()) {
                        AddFamilyMemberService().addFamilyMember(
                          fullName: Name_Controller.text,
                          date_of_birth: date_of_birth_Controller.text,
                          gender: gender_Controller.text,
                          relation: relation_Controller.text,
                          photo: photo,
                          context: context,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Add Member",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
