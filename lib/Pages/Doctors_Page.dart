// import 'package:flutter/material.dart';

// class Doctors_Page extends StatelessWidget {
//   static String id = "Doctors_Page";

//   final List<Map<String, String>> doctors = [
//     {
//       'name': 'Dr. Ahmed Al-Masri',
//       'specialty': 'Cardiologist',
//       'phone': '(123) 456-7890',
//     },
//     {
//       'name': 'Dr. Layla Hassan',
//       'specialty': 'Pediatrician',
//       'phone': '(987) 654-3210',
//     },
//     {
//       'name': 'Dr. Omar Khalil',
//       'specialty': 'Dermatologist',
//       'phone': '(555) 123-4567',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         elevation: 0,
//         title: Text('Nearby Doctors', style: TextStyle(color: Colors.white)),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
//             onPressed: () {
//               // يمكنك وضع أي إجراء هنا
//             },
//           ),
//         ],
//       ),
//       body: ListView.separated(
//         padding: EdgeInsets.all(16),
//         itemCount: doctors.length,
//         separatorBuilder: (context, index) => Divider(),
//         itemBuilder: (context, index) {
//           final doctor = doctors[index];
//           return Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             elevation: 2,
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: Colors.blue[100],
//                 child: Icon(Icons.person, color: Colors.blue),
//               ),
//               title: Text(
//                 doctor['name']!,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [Text(doctor['specialty']!), Text(doctor['phone']!)],
//               ),
//               trailing: Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () {
//                 // يمكنك هنا إضافة توجيه لتفاصيل الطبيب
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ptow/Widget/Doctor_Widget.dart';
import 'package:ptow/services/Get_Doctors_Service.dart';

class Doctors_Page extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text('Nearby Doctors', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),

      body: FutureBuilder(
        future: Get_Doctors_Service().getdoctors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.data);
            return Text("something went wrong");
          }
          if (snapshot.hasData) {
            final Doctors_List = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: Doctors_List.data.length,
              itemBuilder: (context, index) {
                final Doctor = Doctors_List.data[index];
                return Doctor_Wedgit(doctor: Doctor);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
