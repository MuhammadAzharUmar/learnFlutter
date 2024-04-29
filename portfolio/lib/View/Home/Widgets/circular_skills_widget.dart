
import 'package:flutter/material.dart';
import 'package:portfolio/Utlities/colors.dart';

class CircularSkillsWidget extends StatelessWidget {
  const CircularSkillsWidget({
    super.key,
    required this.value,
    required this.title,
  });
  final double value;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(seconds: 3),
            builder: (context, value, child) {
              return Stack(
                children: [
                  CircularProgressIndicator(
                    color: kyellowColor,
                    value: value,
                    backgroundColor: kGreyColor,
                    strokeAlign: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 11, left: 3),
                    child: Text(
                      "${(value * 100).toStringAsFixed(0)} %",
                      style: const TextStyle(color: kfgColor),
                    ),
                  )
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(color: kfgColor, fontSize: 12),
        ),
      ],
    );
  }
}