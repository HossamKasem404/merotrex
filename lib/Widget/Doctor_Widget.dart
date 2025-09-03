// import 'package:flutter/material.dart';
// import 'package:ptow/Models/Doctor_Model.dart';

// class Doctor_Wedgit extends StatelessWidget {
//   final Doctor_Model doctor;

//   Doctor_Wedgit({Key? key, required this.doctor}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundColor: Colors.blue[100],
//         child: Icon(Icons.person, color: Colors.blue),
//       ),
//       title: Text(doctor.name, style: TextStyle(fontWeight: FontWeight.bold)),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [Text(doctor.specialty), Text(doctor.phone)],
//       ),
//       trailing: Icon(Icons.arrow_forward_ios, size: 16),
//       // onTap: () {
//       //   // يمكنك هنا إضافة توجيه لتفاصيل الطبيب
//       // },
//     );
//   }
// }// Doctor_Widget.dart
import 'package:flutter/material.dart';
import 'package:ptow/Models/Doctor_Model.dart';

class Doctor_Wedgit extends StatelessWidget {
  final Doctor_Model doctor;

  const Doctor_Wedgit({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to doctor details
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFffffff), Color(0xFFf7f9fc)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Hero(
              tag: doctor.photo,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(doctor.photo),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF244476),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.medical_services,
                        size: 16,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          doctor.specialty,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16, color: Colors.green),
                      const SizedBox(width: 6),
                      Text(
                        doctor.phone,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF244476).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Color(0xFF244476),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
