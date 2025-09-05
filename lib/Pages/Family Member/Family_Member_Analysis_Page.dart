import 'package:flutter/material.dart';
import 'package:ptow/Widget/Family_Member_Analysis_Widget.dart';
import 'package:ptow/services/Get_FamilyMember_Records_Service.dart';

class Family_Member_Analysis_Page extends StatelessWidget {
  final int FamilyMember_ID;

  Family_Member_Analysis_Page({Key? key, required this.FamilyMember_ID})
    : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF244476),
        elevation: 0,
        title: Text(
          'Family Member Analysis',
          style: TextStyle(color: const Color(0xFFEBF2D6)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFEBF2D6),

      body: FutureBuilder(
        future: Get_FamilyMember_Records_Service().get_Family_Member_analysis(
          FamilyMember_ID,

          context,
        ),

        builder: (context, snapshot) {
          print(FamilyMember_ID);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.data);
            return Text("something went wrong");
          }
          if (snapshot.hasData) {
            final analysis_List = snapshot.data!;
            //  final analysis_List = snapshot.data!;

            if (analysis_List.data.isEmpty) {
              // ✅ السيرفر رجع List فاضي
              return Center(
                child: Text(
                  analysis_List
                      .Message, // مثل "no records for this member in our database"
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }
            return ListView.builder(
              itemCount: analysis_List.data.length,
              itemBuilder: (context, index) {
                final analysis = analysis_List.data[index];
                return Family_Member_Analysis_Widget(analysis: analysis);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
