import 'package:flutter/material.dart';
import '../widgets/cardfeed.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seguimos con el curso"),
        backgroundColor: Colors.grey[300],
      ),
      body:ListView(
        children: [
          CardFeed(),
          CardFeed(),
          CardFeed(),
          CardFeed(),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
    );
  }
}

