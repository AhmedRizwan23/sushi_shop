import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const mybutton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 136, 64, 59),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 20),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
