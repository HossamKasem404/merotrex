import 'package:flutter/material.dart';
import 'package:ptow/Pages/AI_idea_Page.dart';
import 'package:ptow/Pages/Drawer_List.dart';
import 'package:ptow/Pages/Family%20Member/Family_member_Page.dart';
import 'package:ptow/Pages/Setting_Page.dart';

class Home_page extends StatelessWidget {
  static String id = "Home_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer_List(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.local_hospital, color: Colors.white),
            SizedBox(width: 8),
            Text('Dr.You', style: TextStyle(color: Colors.white)),
            Spacer(),
            Icon(Icons.circle_outlined, color: Colors.white),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Day.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 24),

            // Card 1
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.favorite, color: Colors.blue),
                ),
                title: Text(
                  'My Health Record',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('View your personal health data'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Handle navigation
                },
              ),
            ),

            SizedBox(height: 16),

            // Card 2
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.family_restroom, color: Colors.teal),
                ),
                title: Text(
                  'Family Health',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('View your family members data'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Family_Member_Page()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AiIdea_Page()),
                );
              },
              icon: Icon(Icons.add, size: 20),
              label: Text('AI'),
            ),
            label: '',
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          BottomNavigationBarItem(
            icon: TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Settings_Page()),
                );
              },
              icon: Icon(Icons.settings, size: 20),
              label: Text('Settings'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
