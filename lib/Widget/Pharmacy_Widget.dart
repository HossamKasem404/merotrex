import 'package:flutter/material.dart';
import 'package:ptow/Models/Pharmacies_Model.dart';

class Pharmacy_Widget extends StatelessWidget {
  final Pharmacy_Model pharmacy;

  const Pharmacy_Widget({super.key, required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade100,
          child: Icon(Icons.local_pharmacy, color: Colors.green),
        ),
        title: Text(
          pharmacy.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pharmacist: ${pharmacy.name}"),
            Text("Phone: ${pharmacy.phone}"),
            Text("Hours: ${pharmacy.location}"),
            Text("Hours: ${pharmacy.workingHours}"),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
