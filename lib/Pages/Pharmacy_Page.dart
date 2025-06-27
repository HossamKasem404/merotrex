import 'package:flutter/material.dart';

class Pharmacy_Page extends StatelessWidget {
  final List<Map<String, String>> pharmacies = [
    {
      'name': 'Central Pharmacy',
      'address': '123 Main St',
      'phone': '499 Em.x7-5557',
    },
    {
      'name': 'HealthPlus Pharmacy',
      'address': '493 Em .st',
      'phone': '(595) 987–65943',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text('Nearby Pharmacies', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () {
              // يمكنك إضافة إجراء عند الضغط
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: pharmacies.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final pharmacy = pharmacies[index];
          return ListTile(
            title: Text(
              pharmacy['name']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(pharmacy['address']!), Text(pharmacy['phone']!)],
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // يمكنك وضع التوجيه أو أي حدث هنا
            },
          );
        },
      ),
    );
  }
}
