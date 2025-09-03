// import 'package:flutter/material.dart';
// import 'package:ptow/Pages/AI_idea_Page.dart';
// import 'package:ptow/Pages/Drawer_List.dart';
// import 'package:ptow/Pages/Family%20Member/Family_member_Page.dart';
// import 'package:ptow/Pages/Member_Analysis_Page.dart';
// import 'package:ptow/Pages/Setting_Page.dart';

// class Home_page extends StatelessWidget {
//   static String id = "Home_page";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer_List(),
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         elevation: 0,
//         title: Row(
//           children: [
//             Icon(Icons.local_hospital, color: Colors.white),
//             SizedBox(width: 8),
//             Text('Dr.You', style: TextStyle(color: Colors.white)),
//             Spacer(),
//             Icon(Icons.circle_outlined, color: Colors.white),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Good Day.',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 24),

//             // Card 1
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 2,
//               child: ListTile(
//                 leading: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.blue[100],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   padding: EdgeInsets.all(8),
//                   child: Icon(Icons.favorite, color: Colors.blue),
//                 ),
//                 title: Text(
//                   'My Health Record',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text('View your personal health data'),
//                 trailing: Icon(Icons.arrow_forward_ios, size: 16),
//                 onTap: () {
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (_) => Member_Analysis_Page()),
//                   );
//                 },
//               ),
//             ),

//             SizedBox(height: 16),

//             // Card 2
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 2,
//               child: ListTile(
//                 leading: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.teal[100],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   padding: EdgeInsets.all(8),
//                   child: Icon(Icons.family_restroom, color: Colors.teal),
//                 ),
//                 title: Text(
//                   'Family Health',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text('View your family members data'),
//                 trailing: Icon(Icons.arrow_forward_ios, size: 16),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => Family_Member_Page()),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(
//             icon: TextButton.icon(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => AiIdea_Page()),
//                 );
//               },
//               icon: Icon(Icons.add, size: 20),
//               label: Text('AI'),
//             ),
//             label: '',
//           ),
//           // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
//           BottomNavigationBarItem(
//             icon: TextButton.icon(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => Settings_Page()),
//                 );
//               },
//               icon: Icon(Icons.settings, size: 20),
//               label: Text('Settings'),
//             ),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ptow/Pages/AI_idea_Page.dart';
import 'package:ptow/Pages/Drawer_List.dart';
import 'package:ptow/Pages/Family%20Member/Family_member_Page.dart';
import 'package:ptow/Pages/Member_Analysis_Page.dart';

class Home_page extends StatefulWidget {
  static String id = "Home_page";

  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _card1Offset;
  late Animation<Offset> _card2Offset;
  late Animation<double> _fabOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _card1Offset = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _card2Offset = Tween<Offset>(begin: const Offset(0, 0.6), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    _fabOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF2D6),
      drawer: Drawer_List(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF244476),
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        title: Row(
          children: const [
            Icon(Icons.local_hospital, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Dr.You',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Day 👋',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),

            // Card 1
            SlideTransition(
              position: _card1Offset,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(Icons.favorite, color: Color(0xFF244476)),
                  ),
                  title: const Text(
                    'My Health Record',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('View your personal health data'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Member_Analysis_Page()),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Card 2
            SlideTransition(
              position: _card2Offset,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.family_restroom,
                      color: Colors.teal,
                    ),
                  ),
                  title: const Text(
                    'Family Health',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('View your family members data'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Family_Member_Page()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      // زر عائم للـ AI مع Fade
      floatingActionButton: FadeTransition(
        opacity: _fabOpacity,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF244476),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.psychology, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AiIdea_Page()),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
