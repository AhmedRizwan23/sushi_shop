import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, "menupage");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 43, 38),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            height: 15,
          ),
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
