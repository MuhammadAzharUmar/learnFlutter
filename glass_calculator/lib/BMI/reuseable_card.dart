import 'package:flutter/material.dart';

//Resuaable Card
class MyContainer extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPressed;
  const MyContainer({super.key, required this.colour, this.cardChild, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}