import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ptow/Models/Add_FamilyMember_Model.dart';
import 'package:ptow/Pages/Family%20Member/Family_member_Page.dart';
import 'package:ptow/Pages/Home_Page.dart';
import 'package:ptow/Services/Delete_Member_Service.dart';
import 'package:ptow/main.dart';

class FamilyMember_Wedgite extends StatelessWidget {
  final FamilyMember_Model FamilyMember;
  final String token;

  FamilyMember_Wedgite({
    Key? key,
    required this.FamilyMember,
    required this.token,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Confirm Deletion:"),
                content: Text(
                  "Are you sure you want to delete (${FamilyMember.fullName})?",
                ),
                actions: [
                  TextButton(
                    child: const Text("Cancel"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text("Delete"),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Home_page()),
                      );
                      await Delete_Member_Service().deleteMember(
                        FamilyMember.id,
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
          color: const Color.fromARGB(255, 233, 229, 229),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      FamilyMember.photo == null || FamilyMember.photo!.isEmpty
                      ? const AssetImage('assets/logo.png')
                      : NetworkImage(
                          'http://10.0.2.2:8000' + FamilyMember.photo!,
                        ),
                ),

                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FamilyMember.fullName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text("relation: ${FamilyMember.relation}."),
                      Text("gender: ${FamilyMember.gender}."),
                      Text("date_of_birth: ${FamilyMember.dateOfBirth}"),
                    ],
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
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:ptow/Models/Add_FamilyMember_Model.dart';
// import 'package:ptow/Pages/Family%20Member/Family_member_Page.dart';
// import 'package:ptow/Pages/Home_Page.dart';
// import 'package:ptow/Services/Delete_Member_Service.dart';

// class FamilyMember_Wedgite extends StatelessWidget {
//   final FamilyMember_Model FamilyMember;
//   final String token;

//   FamilyMember_Wedgite({
//     Key? key,
//     required this.FamilyMember,
//     required this.token,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Color.fromARGB(255, 150, 169, 179),
//       body: GestureDetector(
//         onLongPress: () {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text("Confirm Deletion:"),
//                 content: Text(
//                   "Are you sure you want to delete (${FamilyMember.fullName})?",
//                 ),
//                 actions: [
//                   TextButton(
//                     child: Text("Cancel"),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   TextButton(
//                     child: Text("Delete"),
//                     onPressed: () async {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => Home_page()),
//                       );
//                       await Delete_Member_Service().deleteMember(
//                         FamilyMember.id,
//                         context,
//                         token,
//                       );
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         },

//         child: Card(
//           color: const Color.fromARGB(255, 233, 229, 229),
//           margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           elevation: 4,
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 35,
//                   backgroundImage: FamilyMember.photo != null
//                       ? NetworkImage(FamilyMember.photo!)
//                       : const AssetImage('assets/images/default_avatar.png')
//                             as ImageProvider,
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         FamilyMember.fullName,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text("relation: ${FamilyMember.relation}."),
//                       Text("gender: ${FamilyMember.gender}."),
//                       Text("date_of_birth: ${FamilyMember.dateOfBirth}"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
