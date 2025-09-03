import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptow/services/Add_FamilyMemeber_Service.dart';

class Add_Family_Member_Page extends StatefulWidget {
  static String id = "AddFamilyMember";

  const Add_Family_Member_Page({super.key});

  @override
  State<Add_Family_Member_Page> createState() => _Add_Family_Member_PageState();
}

class _Add_Family_Member_PageState extends State<Add_Family_Member_Page> {
  Uint8List? photo;

  final _formField = GlobalKey<FormState>();
  final Name_Controller = TextEditingController();
  final gender_Controller = TextEditingController();
  final date_of_birth_Controller = TextEditingController();
  final relation_Controller = TextEditingController();

  getImageCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageBytes = await image.readAsBytes(); // ✅ للويب
    setState(() {
      photo = imageBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF2D6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF244476),
        elevation: 0,
        title: const Text("Add Family Member"),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
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
              children: [
                const SizedBox(height: 16),

                TextField(
                  controller: Name_Controller,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: date_of_birth_Controller,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'year-month-day',
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.date_range),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null) {
                          String formattedDate =
                              "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                          date_of_birth_Controller.text = formattedDate;
                        }
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  value: null,
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    prefixIcon: const Icon(Icons.male),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: ['male', 'female']
                      .map(
                        (gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    gender_Controller.text = value ?? "";
                  },
                ),

                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  value: null,
                  decoration: InputDecoration(
                    hintText: 'Relation',
                    prefixIcon: const Icon(Icons.group),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: ['Father', 'Mother', 'Brother', 'Sister']
                      .map(
                        (relation) => DropdownMenuItem<String>(
                          value: relation,
                          child: Text(relation),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    relation_Controller.text = value ?? "";
                  },
                ),

                const SizedBox(height: 24),

                const Text(
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
                              image: MemoryImage(photo!), // ✅ للويب
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color(0xFF244476),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                ),

                const SizedBox(height: 16),

                Center(
                  child: ElevatedButton.icon(
                    onPressed: getImageCamera,
                    icon: const Icon(Icons.camera),
                    label: const Text("Use Camera"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF244476),
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
                          photo: photo, // Uint8List
                          context: context,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF244476),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Add Member",
                      style: TextStyle(
                        color: Colors.white,
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
