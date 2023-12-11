import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/components/button.dart';

import 'models/food.dart';
import 'models/shop.dart';

class Fooddetailspage extends StatefulWidget {
  final Food food;
  const Fooddetailspage({super.key, required this.food});

  @override
  State<Fooddetailspage> createState() => _FooddetailspageState();
}

class _FooddetailspageState extends State<Fooddetailspage> {
  int quantitycount = 0;

  void minuscount() {
    setState(() {
      if (quantitycount <= 0) {
        quantitycount = 0;
      } else {
        quantitycount--;
      }
    });
  }

  void pluscount() {
    setState(() {
      quantitycount++;
    });
  }

  void addtocart() {
    if (quantitycount > 0) {
      //get access to shop
      final shop = context.read<Shop>();
      //add to cart
      shop.addtocart(widget.food, quantitycount);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Successfully added to cart"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                // two pops for jump to main menu screen
              },
              icon: const Icon(Icons.done),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagepath,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 38),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Description :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey[900]),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.food.Description,
                    style: TextStyle(
                        color: Colors.grey[600], height: 2, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // height: 150,
            // width: 500,
            padding: const EdgeInsets.all(50),
            //margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(45),
              color: Color.fromARGB(255, 136, 34, 27),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${widget.food.price}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(149, 200, 56, 34)),
                      child: IconButton(
                        onPressed: minuscount,
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 6,
                    // ),
                    SizedBox(
                      width: 30,
                      child: Center(
                        child: Text(
                          quantitycount.toString(),
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: 25, color: Colors.grey[300]),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 6,
                    // ),
                    Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(149, 200, 56, 34)),
                        child: IconButton(
                            onPressed: pluscount,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ))),
                  ],
                ),
                mybutton(
                  text: "Add to cart",
                  onTap: addtocart,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
