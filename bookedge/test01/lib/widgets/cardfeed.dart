import 'package:flutter/material.dart';
import 'package:test01/widgets/bottomscard.dart';
import 'descriptioncard.dart';
import 'imagencard.dart';
import 'tittlecard.dart';


class CardFeed extends StatelessWidget {
  const CardFeed({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    const textStyle =
        TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 350,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 179, 167, 166),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: TittleCard(),
            ),
    
            DescriptionCard(),
            //imagenes
            ImagenCard(),
            //bototnes
            Container(
              child: BottomsCard(),
            )
          ],
        ),
      ),
    );
  }
}








