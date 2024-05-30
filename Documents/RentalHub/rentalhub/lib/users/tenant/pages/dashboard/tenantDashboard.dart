import 'package:flutter/material.dart';
import 'package:rentalhub/users/tenant/tenantProfile_page.dart';

class TenantDashboard extends StatefulWidget {
  const TenantDashboard({super.key});

  @override
  State<TenantDashboard> createState() => _TenantDashboardState();
}

class _TenantDashboardState extends State<TenantDashboard> {

  final String tenantName = "Ernest Ephraim";
  final String email = "ernestephraim@gmail.com";
  final String location = "Arusha";
  final int unreadMessages = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
        title: const Text('Rent Now, Smile Always'),
        backgroundColor: Colors.lightBlue,
      ),
      drawer: ProfileDrawer(
        username: tenantName,
        email: email,
        location: location,
        role: "Tenant",
        onLogout: () {
          // Implement logout functionality
        },
      ),
    );
  }
}
