import 'package:flutter/material.dart';
import 'package:ptow/Models/Add_FamilyMember_Model.dart';
import 'package:ptow/Pages/Family%20Member/Family_Member_Analysis_Page.dart';
import 'package:ptow/Pages/family_memmber_upload_file.dart';
import 'package:ptow/Services/Delete_Member_Service.dart';
import 'package:ptow/Pages/Home_Page.dart';

class FamilyMember_Widget extends StatelessWidget {
  final FamilyMember_Model familyMember;
  final String token;

  const FamilyMember_Widget({
    super.key,
    required this.familyMember,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                "Confirm Deletion:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Text(
                "Are you sure you want to delete (${familyMember.fullName})?",
              ),
              actions: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.delete, size: 18, color: Colors.white),
                  label: const Text("Delete"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const Home_page()),
                    );
                    await Delete_Member_Service().deleteMember(
                      familyMember.id,
                      context,
                      token,
                    );
                  },
                ),
              ],
            );
          },
        );
      },

      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                // backgroundColor: const Color(0xFF244476),
                backgroundImage:
                    (familyMember.photo == null || familyMember.photo!.isEmpty)
                    ? const AssetImage('assets/logo.png') as ImageProvider
                    : NetworkImage(
                        'http://10.0.2.2:8000${familyMember.photo!}',
                      ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      familyMember.fullName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF244476),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text("👨 Relation: ${familyMember.relation}"),
                    Text("⚧ Gender: ${familyMember.gender}"),
                    Text("🎂 Date of Birth: ${familyMember.dateOfBirth}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Family_Member_Analysis_Page(
                                      FamilyMember_ID: familyMember.id,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                '${familyMember.fullName} Analisis',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Family_Memmber_Upload_File(
                                  familyMemberID: familyMember.id,
                                ),
                              ),
                            );
                          },
                          child: Text('+AI', style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
