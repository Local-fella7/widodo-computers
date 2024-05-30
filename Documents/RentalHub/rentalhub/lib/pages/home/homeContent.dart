import 'package:flutter/material.dart';
import 'package:rentalhub/pages/home/home.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        House(
          image: '/lib/images/apple.png',
          description: 'A beautiful 3 bedroom house.',
          price: 250000,
          phone: 23-456-7890,
        ),
        House(
          image: '/lib/images/google.png',
          description: 'Modern 2 bedroom apartment.',
          price: 150000,
          phone: 987-654-3210,
        ),
      ],
    );
  }
}