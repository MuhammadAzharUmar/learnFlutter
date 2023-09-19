import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });
  final Widget icon;
  // final Function()? onPressed;//same as below
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height * .085,
        width: MediaQuery.of(context).size.width * .20,
        decoration:  BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade700,
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(-4, -5)),
             BoxShadow(color: Colors.grey.shade900,
            blurRadius: 10,
            spreadRadius: 1,
             offset: const Offset(4, 5)),
          ]
        ),
        child: icon,
      ),
    );
  }
}
