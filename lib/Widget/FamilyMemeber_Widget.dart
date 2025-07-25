import 'package:flutter/material.dart';
import 'package:ptow/Models/Add_FamilyMember_Model.dart';

class FamilyMember_Wedgite extends StatelessWidget {
  final FamilyMemberModel FamilyMember;

  FamilyMember_Wedgite({Key? key, required this.FamilyMember})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 150, 169, 179),
      body: GestureDetector(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => TripsWithCountry(countryforsearchtrip: country,),));
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: FamilyMember.photo != null
                      ? NetworkImage(FamilyMember.photo!)
                      : const AssetImage('assets/images/default_avatar.png')
                            as ImageProvider,
                ),

                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FamilyMember.fullName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text("relation: ${FamilyMember.relation}."),
                      Text("gender: ${FamilyMember.gender}."),
                      Text("age: ${FamilyMember.age}  years old."),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
