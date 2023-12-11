import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_shop/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 43, 38),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Trout",
            style:
                GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
          ),
          const SizedBox(
            height: 25,
          ),
          const Image(
            image: AssetImage("lib/assets/sushi1.png"),
            height: 200,
            width: 400,
          ),
          Text(
            "THE JAPANESE FOOD",
            style:
                GoogleFonts.dmSerifDisplay(fontSize: 44, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(85.0),
            child: Text(
              "Feel the taste of the most popular Japanese food from anywhere and anytime",
              style: TextStyle(color: Colors.grey[200], height: 2),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          mybutton(
            text: "Get Started",
            onTap: () {
              Navigator.pushNamed(context, "menupage");
            },
          )
        ],
      ),
    );
  }
}
