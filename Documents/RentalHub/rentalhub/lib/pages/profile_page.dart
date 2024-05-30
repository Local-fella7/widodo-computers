import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  final String username;
  final String email;
  final String role;
  final String location;
  final VoidCallback onLogout;

  ProfileDrawer({
    required this.username,
    required this.email,
    required this.role,
    required this.location,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome, $username',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Email: $email'),
            leading: Icon(Icons.email),
          ),
          ListTile(
            title: Text('Role: $role'),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text('Location: $location'),
            leading: Icon(Icons.location_on),
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}
