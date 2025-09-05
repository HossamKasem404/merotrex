import 'package:flutter/material.dart';
import 'package:ptow/Pages/upload_File.dart';
import 'package:ptow/Widget/My_Analysis_Widget.dart';
import 'package:ptow/main.dart';
import 'package:ptow/services/Get_My_Records_Service.dart';

class Member_Analysis_Page extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF244476),
        elevation: 0,
        title: Text('Personal Analysis', style: TextStyle(color: Colors.white)),
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Upload_File_Page()),
          );
        },
        child: Icon(Icons.add),
      ),

      body: FutureBuilder(
        future: Get_My_Records_Service().get_my_analysis(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.data);
            return Text("something went wrong");
          }
          if (snapshot.hasData) {
            final analysis_List = snapshot.data!;
            return ListView.builder(
              itemCount: analysis_List.data.length,
              itemBuilder: (context, index) {
                final analysis = analysis_List.data[index];
                return My_Analysis_Widget(analysis: analysis);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
