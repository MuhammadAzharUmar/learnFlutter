import 'package:flutter/material.dart';
import 'package:glass_calculator/BMI/constants.dart';

//Reuseable card child
class CardIcons extends StatelessWidget {
  final IconData icon;
  final String textt;
  const CardIcons({
    super.key,
    required this.icon,
    required this.textt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          textt,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
