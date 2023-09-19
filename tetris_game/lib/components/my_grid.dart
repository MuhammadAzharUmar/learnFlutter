import 'dart:math';

import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({
    required this.landedPieces,
    required this.pieceColor,
    required this.newColor,
    required this.newPiec,
    super.key,
  });
  final List<int> landedPieces;
  final List<Color> pieceColor;
  final List<int> newPiec;
  final Color newColor;
  @override
  Widget build(BuildContext context) {
    double count = ((MediaQuery.of(context).size.height * .85) *
            (MediaQuery.of(context).size.width * 1)) /
        100;
    return GridView.builder(
        // itemCount: count.toInt(),
        itemCount: 170,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
        itemBuilder: (context, index) {
          for (var i = 0; i < landedPieces.length; i++) {
            
            if (landedPieces[i]==index) {
              return MyPixel(
                color: pieceColor[Random().nextInt(pieceColor.length)],
              );
            }
          }
          
          if (newPiec.contains(index)) {
            return MyPixel(
              color: newColor,
            );
          } else {
            return const MyPixel(
              color: Colors.black);
          }
          // return  MyPixel(color: newColor);
        });
  }
}

class MyPixel extends StatelessWidget {
  const MyPixel({
    required this.color,
    super.key,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      height: 10,
      width: 10,
      color: color,
    );
  }
}
