
import 'package:flutter/material.dart';
import 'package:portfolio/Utlities/colors.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    super.key,
    required this.textt,
    required this.value,
  });
  final String textt;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            textt,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                // fontFamily: 'Satisfy',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: kfgColor),
          ),
          Text(
            value,
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
    );
  }
}
