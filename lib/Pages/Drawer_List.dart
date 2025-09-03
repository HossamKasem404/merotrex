// import 'package:flutter/material.dart';
// import 'package:ptow/Pages/Doctors_Page.dart';
// import 'package:ptow/Pages/Pharmacies_Page.dart';
// import 'package:ptow/Pages/Setting_Page.dart';
// import 'package:ptow/services/LogOut_Service.dart';
// import 'package:ptow/main.dart';

// class Drawer_List extends StatelessWidget {
//   const Drawer_List({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final appState = MyApp.of(context);

//     return Drawer(
//       backgroundColor: const Color(0xFFEBF2D6),
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           UserAccountsDrawerHeader(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF244476), Color(0xFF4a6fa5)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             accountName: const Text(
//               "Dr. John Doe",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             accountEmail: const Text("john.doe@email.com"),
//             currentAccountPicture: const CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Icon(Icons.person, size: 40, color: Color(0xFF244476)),
//             ),
//           ),

//           // Section 1
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Text(
//               "Explore",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.local_hospital),
//             title: const Text('Nearby Doctors'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => Doctors_Page()),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.local_pharmacy),
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 Text('Nearby Pharmacies'),
//                 CircleAvatar(
//                   radius: 10,
//                   backgroundColor: Colors.red,
//                   child: Text(
//                     "3",
//                     style: TextStyle(color: Colors.white, fontSize: 12),
//                   ),
//                 ),
//               ],
//             ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => Pharmacies_Page()),
//               );
//             },
//           ),

//           const Divider(),

//           // Section 2
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Text(
//               "Preferences",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Settings'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => Settings_Page()),
//               );
//             },
//           ),
//           SwitchListTile(
//             secondary: const Icon(Icons.brightness_6),
//             title: Text(
//               appState?.themeMode == ThemeMode.dark
//                   ? "Dark Mode"
//                   : "Light Mode",
//             ),
//             value: appState?.themeMode == ThemeMode.dark,
//             onChanged: (val) {
//               appState?.toggleTheme();
//             },
//           ),

//           const Divider(),

//           // Section 3
//           ListTile(
//             leading: const Icon(Icons.logout),
//             title: const Text('Log out'),
//             onTap: () {
//               LogOut_Service(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ptow/Models/Login_Model.dart';
import 'package:ptow/Pages/Doctors_Page.dart';
import 'package:ptow/Pages/Pharmacies_Page.dart';
import 'package:ptow/Pages/Setting_Page.dart';
import 'package:ptow/services/LogOut_Service.dart';
import 'package:ptow/main.dart';

class Drawer_List extends StatelessWidget {
  const Drawer_List({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = MyApp.of(context);

    return Drawer(
      backgroundColor: const Color(0xFFEBF2D6),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF244476), Color(0xFF4a6fa5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: Text(
              "${userinfo["Data"]["first_name"]}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: Text("${userinfo["Data"]["email"]}"),
            currentAccountPicture: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              // child: Image.network(userinfo["Data"]["photo"]),
              child: ClipOval(
                child: Image.network(
                  "http://10.0.2.2:8000${userinfo["Data"]["photo"]}",
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ),

          // Section 1
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Explore",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital),
            title: const Text('Nearby Doctors'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Doctors_Page()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_pharmacy),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Nearby Pharmacies'),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Pharmacies_Page()),
              );
            },
          ),

          const Divider(),

          // Section 2
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Preferences",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Settings_Page()),
              );
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.brightness_6),
            title: Text(
              appState?.themeMode == ThemeMode.dark
                  ? "Dark Mode"
                  : "Light Mode",
            ),
            value: appState?.themeMode == ThemeMode.dark,
            onChanged: (val) {
              appState?.toggleTheme();
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
              LogOut_Service(context);
            },
          ),
        ],
      ),
    );
  }
}
