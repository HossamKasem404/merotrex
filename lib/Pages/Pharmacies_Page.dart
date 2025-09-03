import 'package:flutter/material.dart';
import 'package:ptow/Widget/Pharmacy_Widget.dart';
import 'package:ptow/services/pharmacies_Service.dart';

class Pharmacies_Page extends StatelessWidget {
  const Pharmacies_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF2D6),
      appBar: AppBar(
        backgroundColor: Color(0xFF244476),
        elevation: 0,
        title: Text('Nearby Pharmacies', style: TextStyle(color: Colors.white)),
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
        future: Get_Pharmacies_Service().getPharmacies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.data);
            return Text("Something went wrong");
          }
          if (snapshot.hasData) {
            final pharmaciesList = snapshot.data!;
            return ListView.builder(
              itemCount: pharmaciesList.data.length,
              itemBuilder: (context, index) {
                final pharmacy = pharmaciesList.data[index];
                return Pharmacy_Widget(pharmacy: pharmacy);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
