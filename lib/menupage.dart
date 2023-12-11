import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/components/button.dart';

import 'components/Foodtile.dart';
import 'foodetailspage.dart';
import 'models/shop.dart';

class Menupage extends StatefulWidget {
  const Menupage({super.key});

  @override
  State<Menupage> createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  void navigatetofooddetails(int index) {
    final shop = context.read<Shop>();
    final foodmenu = shop.foodmenu;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Fooddetailspage(
            food: foodmenu[index],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodmenu = shop.foodmenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Tokyo",
          style: GoogleFonts.dmSerifDisplay(color: Colors.grey[800]),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "cart");
              },
              icon: const Icon(Icons.shopping_basket_rounded))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 108, 36, 31),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Get 20% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    mybutton(
                      text: "Redeem",
                      onTap: () {},
                    )
                  ],
                ),
                const Image(
                  image: AssetImage("lib/assets/sushi3.png"),
                  height: 100,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search here",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Food Menu",
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20, color: Colors.grey[800]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodmenu.length,
              itemBuilder: (BuildContext context, int index) {
                return Foodtile(
                  food: foodmenu[index],
                  onTap: () {
                    navigatetofooddetails(index);
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //popular food
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 136, 48, 48),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage("lib/assets/sushi1.png"),
                  height: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Salmon Eggs",
                      style: GoogleFonts.dmSerifDisplay(),
                    ),
                    Text(
                      "\$30",
                      style: TextStyle(color: Colors.grey[900]),
                    )
                  ],
                ),
                const SizedBox(
                  width: 150,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outlined),
                    color: Colors.grey[600],
                    iconSize: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
