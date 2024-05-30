import 'package:flutter/material.dart';
import 'package:rentalhub/users/tenant/pages/dashboard/tenantDashboard.dart';
import 'package:rentalhub/users/tenant/pages/message/tenanatListMessages.dart';
import 'package:rentalhub/users/tenant/pages/view/tenantView.dart';

class TenantHomePage extends StatefulWidget {
  const TenantHomePage({super.key});

  @override
  State<TenantHomePage> createState() => _TenantHomePageState();
}

class _TenantHomePageState extends State<TenantHomePage> {
 int selectedIndex = 0;

  final List<Widget> pages = [
    TenantDashboard(),
    TenantView(),
    TenantListMessages(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'View',
            ),
             
            BottomNavigationBarItem(
              icon: Icon(Icons.sms_rounded),
              label: 'Messages',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          onTap: onItemTapped,
        )
    );
  }
}