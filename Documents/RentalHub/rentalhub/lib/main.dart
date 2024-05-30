import 'package:flutter/material.dart';
import 'package:rentalhub/pages/home_page.dart';
import 'package:rentalhub/pages/login_page.dart';
import 'package:rentalhub/users/owner/owner_page.dart';
// Import the PostPage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/sign-in': (context) => LoginPage(),
        '/home_page': (context) => HomePage(),
        '/owner_page': (context) => OwnerHomePage(),
        
      },
    );
  }
}
