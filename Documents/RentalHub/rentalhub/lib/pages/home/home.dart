import 'package:flutter/material.dart';

class House extends StatelessWidget {
  final String image;
  final String description;
  final int price;
  final int phone;
  const House({super.key, required this.image, required this.description, required this.price, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Image(
              image: AssetImage(
                "assets\images\apple.png"
              ),
            ),
          ),
          Text("Description: $description"),
          Text("Price : $price"),
          Text("Owner Phone : $phone")
        ],
      ),
    );
  }
}
