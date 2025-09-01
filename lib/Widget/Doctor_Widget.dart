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
// }
import 'package:flutter/material.dart';
import 'package:ptow/Models/Doctor_Model.dart';

class Doctor_Wedgit extends StatelessWidget {
  final Doctor_Model doctor;

  Doctor_Wedgit({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(doctor.photo),
      ),
      title: Text(doctor.name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(doctor.specialty), Text(doctor.phone)],
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      // onTap: () {
      //   // يمكنك هنا إضافة توجيه لتفاصيل الطبيب
      // },
    );
  }
}
