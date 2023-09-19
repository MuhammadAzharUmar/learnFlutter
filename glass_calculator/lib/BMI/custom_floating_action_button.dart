import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      onPressed: onPressed,
      fillColor: const Color(0xff4C4F5E),
      shape: const CircleBorder(),
      constraints: BoxConstraints.tight(const Size(56, 56)),
      child: Icon(icon),
    );
  }
}
