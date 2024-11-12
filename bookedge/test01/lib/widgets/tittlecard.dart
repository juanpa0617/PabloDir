import 'package:flutter/material.dart';
class TittleCard extends StatelessWidget {
  const TittleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          child: Text("J"),
        ),
        //separaciones
        SizedBox(width: 10),
        Text(
          "jUAN",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 173, 56, 56)),
        )
      ],
    );
  }
}