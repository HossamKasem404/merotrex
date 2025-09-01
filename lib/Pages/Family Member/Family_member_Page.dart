import 'package:flutter/material.dart';
import 'package:ptow/Pages/Family%20Member/Add_Family_Member_Page.dart';
import 'package:ptow/Widget/FamilyMemeber_Widget.dart';
import 'package:ptow/main.dart';
import 'package:ptow/services/Get_FamilyMember_Service.dart';

class Family_Member_Page extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text('My Family', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Add_Family_Member_Page()),
          );
        },
        child: Icon(Icons.add),
      ),

      body: FutureBuilder(
        future: GetFamilyMembersService().getFamilyMembers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.data);
            return Text("something went wrong");
          }
          if (snapshot.hasData) {
            final FamilyMember_List = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: FamilyMember_List.data.length,
              itemBuilder: (context, index) {
                final FamilyMember = FamilyMember_List.data[index];
                return FamilyMember_Wedgite(
                  FamilyMember: FamilyMember,
                  token: token,
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
