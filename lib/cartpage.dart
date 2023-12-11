import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/components/button.dart';

import 'models/food.dart';
import 'models/shop.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});
  void removefromcart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removefromcart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 108, 36, 31),
        appBar: AppBar(
          title: Text(
            "Your Order",
            style: GoogleFonts.dmSerifDisplay(),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (BuildContext context, int index) {
                  final Food food = value.cart[index];

                  final String foodname = food.name;

                  final String foodprice = food.price;

                  return ListTile(
                    title: Text(
                      foodname,
                      style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                    ),
                    subtitle: Text(
                      "\$ $foodprice",
                      style: GoogleFonts.dmSerifDisplay(fontSize: 30),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        removefromcart(food, context);
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
            mybutton(
              text: "Pay",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
