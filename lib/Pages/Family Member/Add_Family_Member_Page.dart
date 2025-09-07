import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptow/Widget/buttonWidget.dart';
import 'package:ptow/services/Add_FamilyMemeber_Service.dart';

class Add_Family_Member_Page extends StatefulWidget {
  static String id = "AddFamilyMember";

  const Add_Family_Member_Page({super.key});

  @override
  State<Add_Family_Member_Page> createState() => _Add_Family_Member_PageState();
}

class _Add_Family_Member_PageState extends State<Add_Family_Member_Page> {
  File? photo;

  getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      photo = imageTemporary;
    });
  }

  getImageCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      photo = imageTemporary;
    });
  }

  final _formField = GlobalKey<FormState>();
  final Name_Controller = TextEditingController();
  final gender_Controller = TextEditingController();
  final date_of_birth_Controller = TextEditingController();
  final relation_Controller = TextEditingController();

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

                const Positioned(
                  top: 450,
                  left: 30,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Add Your  photo",
                      style: TextStyle(
                        color: Color(0xFF244476),
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
                                  color: Color(0xFF244476),
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
                        color: Color(0xFF244476),
                        text: "Use Gallery",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ButtonWidget(
                          onTap: getImageCamera,
                          height: 50,
                          width: 150,
                          color: Color(0xFF244476),
                          text: "UseCamera",
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

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
