import 'package:flutter/material.dart';
class ImagenCard extends StatelessWidget {
  const ImagenCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Image.network(
        "https://static1.srcdn.com/wordpress/wp-content/uploads/2023/10/valorant-iso-handson.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}