import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/food.dart';

class Foodtile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const Foodtile({super.key, required this.food,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Image(image: AssetImage(food.imagepath), height: 150),
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 20),
            ),
            SizedBox(
              height: 20,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${food.price}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[900]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star, color: Colors.yellow[800]),
                      Text(food.rating),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
