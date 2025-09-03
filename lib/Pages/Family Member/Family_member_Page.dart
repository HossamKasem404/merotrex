import 'package:flutter/material.dart';
import 'package:ptow/Pages/Family%20Member/Add_Family_Member_Page.dart';
import 'package:ptow/Widget/FamilyMemeber_Widget.dart';
import 'package:ptow/main.dart';
import 'package:ptow/services/Get_FamilyMember_Service.dart';

class Family_Member_Page extends StatefulWidget {
  const Family_Member_Page({super.key});

  @override
  State<Family_Member_Page> createState() => _Family_Member_PageState();
}

class _Family_Member_PageState extends State<Family_Member_Page> {
  late Future familyMembersFuture;

  @override
  void initState() {
    super.initState();
    familyMembersFuture = GetFamilyMembersService().getFamilyMembers();
  }

  void refreshMembers() {
    setState(() {
      familyMembersFuture = GetFamilyMembersService().getFamilyMembers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF2D6),

      appBar: AppBar(
        backgroundColor: const Color(0xFF244476),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '👨‍👩‍👧 My Family',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF244476),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Add_Family_Member_Page()),
          );

          if (result == true) {
            refreshMembers(); // ✅ تحديث القائمة بعد الرجوع
          }
        },
        label: const Text("Add Member", style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.person_add, color: Colors.white),
      ),

      body: FutureBuilder(
        future: familyMembersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF244476)),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("⚠️ Something went wrong"));
          }
          if (snapshot.hasData) {
            final familymemberList = snapshot.data!;
            if (familymemberList.data.isEmpty) {
              return const Center(
                child: Text(
                  "No family members found 👀",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              itemCount: familymemberList.data.length,
              itemBuilder: (context, index) {
                final familyMember = familymemberList.data[index];
                return FamilyMember_Widget(
                  familyMember: familyMember,
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
