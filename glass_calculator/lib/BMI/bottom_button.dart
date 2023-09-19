import 'package:flutter/material.dart';
import 'package:glass_calculator/BMI/constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const BottomButton({
    super.key,required this.onTap,required this.title
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 20),
        height: 80,
        width: double.infinity,
        child:  Center(
            child: Text(
          title,
          style: bottomContainerTextStyle,
        )),
      ),
    );
  }
}
