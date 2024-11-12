import 'package:flutter/material.dart';
class BottomsCard extends StatelessWidget {
  const BottomsCard({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    const textStyle =
        TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold);
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
            onPressed: () {},
            child: const Text("Me gusta", style: textStyle)),
        TextButton(
            onPressed: () {},
            child: const Text("Comentar", style: textStyle)),
        TextButton(
            onPressed: () {},
            child: const Text("Compartir", style: textStyle)),
      ],
    );
  }
}