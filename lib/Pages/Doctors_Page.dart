import 'package:flutter/material.dart';

class Doctors_Page extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. Ahmed Al-Masri',
      'specialty': 'Cardiologist',
      'phone': '(123) 456-7890',
    },
    {
      'name': 'Dr. Layla Hassan',
      'specialty': 'Pediatrician',
      'phone': '(987) 654-3210',
    },
    {
      'name': 'Dr. Omar Khalil',
      'specialty': 'Dermatologist',
      'phone': '(555) 123-4567',
    },
  ];

  @override
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
              // يمكنك وضع أي إجراء هنا
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: doctors.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Icon(Icons.person, color: Colors.blue),
              ),
              title: Text(
                doctor['name']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(doctor['specialty']!), Text(doctor['phone']!)],
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // يمكنك هنا إضافة توجيه لتفاصيل الطبيب
              },
            ),
          );
        },
      ),
    );
  }
}
