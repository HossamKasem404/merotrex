// Doctors_Page.dart
import 'package:flutter/material.dart';
import 'package:ptow/Widget/Doctor_Widget.dart';
import 'package:ptow/services/Get_Doctors_Service.dart';

class Doctors_Page extends StatelessWidget {
  const Doctors_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF2D6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF244476),
        elevation: 0,
        title: const Text(
          'Nearby Doctors',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // TODO: search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              // TODO: filter action
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Get_Doctors_Service().getdoctors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }
          if (snapshot.hasData) {
            final doctorsList = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: doctorsList.data.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final doctor = doctorsList.data[index];
                return Doctor_Wedgit(doctor: doctor);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
