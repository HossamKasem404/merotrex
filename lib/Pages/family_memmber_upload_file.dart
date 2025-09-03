// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ptow/Models/Add_FamilyMember_Model.dart';
// import 'package:ptow/Widget/buttonWidget.dart';
// import 'package:ptow/services/PDF_Service.dart';
// import 'package:file_picker/file_picker.dart';

// class Family_Memmber_Upload_File extends StatefulWidget {
//   static String id = "Signup";

//   @override
//   State<Family_Memmber_Upload_File> createState() =>
//       _Family_Memmber_Upload_FileState();
// }

// class _Family_Memmber_Upload_FileState
//     extends State<Family_Memmber_Upload_File> {
//   dynamic photo;
//   dynamic pdfFile;
//   late final FamilyMember_Model familyMember;
//   // Pick image from gallery
//   getImage() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image == null) return;
//     final imageTemporary = File(image.path);
//     setState(() {
//       photo = imageTemporary;
//       pdfFile = null; // reset pdf if image chosen
//     });
//   }

//   // Pick PDF file
//   Future<void> pickPDF() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (result != null) {
//       setState(() {
//         pdfFile = File(result.files.single.path!);
//         photo = null; // reset image if pdf chosen
//       });
//     }
//   }

//   final _formField = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         elevation: 0,
//         title: Row(
//           children: [
//             Icon(Icons.medical_services, color: Colors.white),
//             Spacer(),
//             Text('A1', style: TextStyle(color: Colors.white)),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Form(
//               key: _formField,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(height: 24),
//                   Text(
//                     'AI Diagnosis',
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),

//                   SizedBox(height: 16),

//                   Text(
//                     'Upload blood test report to analyse potential issues.',
//                     style: TextStyle(color: Colors.black54, fontSize: 16),
//                   ),
//                   SizedBox(height: 24),

//                   Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: Text(
//                       "Add Your Docs",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 20),

//                   // File/Image preview
//                   if (photo != null)
//                     Container(
//                       width: 400,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.black12,
//                         image: DecorationImage(
//                           image: FileImage(photo!),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     )
//                   else if (pdfFile != null)
//                     Container(
//                       width: 400,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.blue.shade50,
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Selected PDF: ${pdfFile!.path.split('/').last}",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     )
//                   else
//                     Container(
//                       width: 400,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.white,
//                       ),
//                       child: Center(child: Text("No File Selected")),
//                     ),

//                   SizedBox(height: 30),

//                   // Buttons
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ButtonWidget(
//                         onTap: getImage,
//                         height: 50,
//                         width: 150,
//                         color: const Color.fromARGB(255, 0, 0, 0),
//                         text: "Use Gallery",
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: ButtonWidget(
//                           onTap: pickPDF,
//                           height: 50,
//                           width: 150,
//                           color: Colors.black,
//                           text: "Upload PDF",
//                         ),
//                       ),
//                     ],
//                   ),

//                   SizedBox(height: 16),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formField.currentState!.validate()) {
//                           if (pdfFile != null) {
//                             Pdf_Service().getPdfAnalysis(
//                               id: familyMember.id,
//                               pdf: pdfFile,
//                               context: context,
//                             );
//                           } else if (photo != null) {
//                             Pdf_Service().getPdfAnalysis(
//                               id: familyMember.id,
//                               pdf: photo,
//                               context: context,
//                             );
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(
//                                   "Please upload an image or a PDF",
//                                 ),
//                               ),
//                             );
//                           }
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text(
//                         'Analyze',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptow/Models/Add_FamilyMember_Model.dart';
import 'package:ptow/Widget/buttonWidget.dart';
import 'package:ptow/services/PDF_Service.dart';
import 'package:file_picker/file_picker.dart';

class Family_Memmber_Upload_File extends StatefulWidget {
  static String id = "Signup";

  final int familyMemberID; // ✅ متغير نستقبله من برّا

  const Family_Memmber_Upload_File({
    Key? key,
    required this.familyMemberID, // ✅ الباني
  }) : super(key: key);

  @override
  State<Family_Memmber_Upload_File> createState() =>
      _Family_Memmber_Upload_FileState();
}

class _Family_Memmber_Upload_FileState
    extends State<Family_Memmber_Upload_File> {
  dynamic photo;
  dynamic pdfFile;

  final _formField = GlobalKey<FormState>();

  // Pick image from gallery
  getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      photo = imageTemporary;
      pdfFile = null; // reset pdf if image chosen
    });
  }

  // Pick PDF file
  Future<void> pickPDF() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        pdfFile = File(result.files.single.path!);
        photo = null; // reset image if pdf chosen
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF2D6),
      appBar: AppBar(
        backgroundColor: Color(0xFF244476),
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.medical_services, color: Colors.white),
            Spacer(),
            Text('A1', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
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
                  Text(
                    'AI Diagnosis',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: 16),

                  Text(
                    'Upload blood test report to analyse potential issues.',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Add Your Docs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // File/Image preview
                  if (photo != null)
                    Container(
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
                    )
                  else if (pdfFile != null)
                    Container(
                      width: 400,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade50,
                      ),
                      child: Center(
                        child: Text(
                          "Selected PDF: ${pdfFile!.path.split('/').last}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  else
                    Container(
                      width: 400,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Center(child: Text("No File Selected")),
                    ),

                  SizedBox(height: 30),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                        onTap: getImage,
                        height: 50,
                        width: 150,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        text: "Use Gallery",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ButtonWidget(
                          onTap: pickPDF,
                          height: 50,
                          width: 150,
                          color: Colors.black,
                          text: "Upload PDF",
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formField.currentState!.validate()) {
                          if (pdfFile != null) {
                            Pdf_Service().getPdfAnalysis(
                              id: widget.familyMemberID,
                              pdf: pdfFile,
                              context: context,
                            );
                          } else if (photo != null) {
                            Pdf_Service().getPdfAnalysis(
                              id: widget.familyMemberID,
                              pdf: photo,
                              context: context,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Please upload an image or a PDF",
                                ),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF244476),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Analyze',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
