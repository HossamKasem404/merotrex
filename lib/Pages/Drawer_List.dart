import 'package:flutter/material.dart';
import 'package:ptow/Pages/Doctors_Page.dart';
import 'package:ptow/Pages/Pharmacy_Page.dart';
import 'package:ptow/Pages/Setting_Page.dart';

class Drawer_List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text("Use Drop And Be The Top")),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Nearby Doctors'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Doctors_Page()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.local_pharmacy),
            title: Text('Nearby Pharmacies'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Pharmacy_Page()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Settings_Page()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
