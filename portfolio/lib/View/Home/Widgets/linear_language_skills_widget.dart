
import 'package:flutter/material.dart';
import 'package:portfolio/Utlities/colors.dart';

class LinearCodingSkillsWidget extends StatelessWidget {
  const LinearCodingSkillsWidget(
      {super.key, required this.value, required this.title});
  final double value;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 3),
        tween: Tween(begin: 0, end: value),
        builder: (context, value, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: kfgColor, fontSize: 12),
                  ),
                  Text(
                    "${(value * 100).toStringAsFixed(0)} %",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        // fontFamily: 'Satisfy',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: kGreyColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              LinearProgressIndicator(
                value: value.toDouble(),
                color: kyellowColor,
                backgroundColor: kGreyColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
