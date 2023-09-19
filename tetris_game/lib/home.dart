import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'components/my_button.dart';
import 'components/my_grid.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> chosenPiece = [];
  int score = 0;
  List<int> landed = [];
  List<List<int>> landedPieces = [];
  final List<List<int>> _pieces = [
    [4, 5, 14, 15],
    [4, 14, 24, 25],
    [5, 15, 24, 25],
    [4, 14, 24, 34],
    [4, 14, 15, 25],
    [5, 15, 14, 24],
  ];

  static List<Color> pieceColor = [
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.green,
    Colors.blue,
    Colors.brown,
    Colors.pink,
  ];

  Color newColor = pieceColor[Random().nextInt(pieceColor.length)];
  void choosePiece() {
    List<int> newPiece = _pieces[Random().nextInt(_pieces.length)];
    chosenPiece = List.from(newPiece);
  }

  void resetPieces() {
    setState(() {
      chosenPiece = [];
    });
  }

  void startGame() {
    resetPieces();
    choosePiece();
    Duration duration = const Duration(milliseconds: 300);
    Timer.periodic(duration, (timer) {
      clearRow();
      if (hitFloor()) {
        for (int i = 0; i < chosenPiece.length; i++) {
          if (landed.contains(chosenPiece[i])) {
          } else {
            landed.add(chosenPiece[i]);
          }
        }
        landedPieces.add(chosenPiece);
        timer.cancel();
        landed.sort();
        if (landed.first - 10 < 0) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Game Ended"),
                  content: Text(
                    "Score : $score",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () {
                          restart();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Restart",
                          style: TextStyle(color: Colors.amber, fontSize: 22),
                        ))
                  ],
                );
              });
        } else {
          timer.cancel();
          startGame();
        }
      } else {
        moveDown();
      }
    });
  }

  void clearRow() {
    int count = 0;
    List<int> removeRow = [];
    for (var i = 0; i < 17; i++) {
      removeRow.clear();
      count = 0;
      for (var j = 0; j < 10; j++) {
        if (landed.contains(169 - (i * 10) - j)) {
          removeRow.add(169 - (i * 10) - j);
          count++;
        }
      }
      if (count == 10) {
        score++;
        removeRow.sort();
        for (var i = 0; i < landed.length; i++) {
          if (landed[i] < removeRow.first) {
            setState(() {
              landed[i] += 10;
            });
          }
        }
        setState(() {
          for (var element in removeRow) {
            landed.remove(element);
          }
        });
      }
    }
  }

  void moveLeft() {
    if (chosenPiece.any(
        (element) => (element) % 10 == 0 || landed.contains(element - 1))) {
      // ignore: avoid_print
      print("cann't move left");
    } else {
      for (int i = 0; i < chosenPiece.length; i++) {
        setState(() {
          chosenPiece[i] -= 1;
        });
      }
    }
  }

  void moveRight() {
    if (chosenPiece.any(
        (element) => (element + 1) % 10 == 0 || landed.contains(element + 1))) {
      // ignore: avoid_print
      print("cann't move right");
    } else {
      for (int i = 0; i < chosenPiece.length; i++) {
        setState(() {
          chosenPiece[i] += 1;
        });
      }
    }
  }

  void restart() {
    score = 0;
    landed = [];
    chosenPiece = [];
    landedPieces = [];
    runApp(const MyApp());
    startGame();
  }

  void moveDown() {
    for (int i = 0; i < chosenPiece.length; i++) {
      setState(() {
        chosenPiece[i] = chosenPiece[i] + 10;
      });
    }
  }

  bool hitFloor() {
    bool hitfloor = false;
    chosenPiece.sort();
    if (chosenPiece.last + 10 > 169) {
      hitfloor = true;
    }

    for (int i = 0; i < chosenPiece.length; i++) {
      if (landed.contains(chosenPiece[i] + 10)) {
        hitfloor = true;
      }
    }

    return hitfloor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              width: double.infinity,
              child: CustomGrid(
                  landedPieces: landed,
                  newColor: newColor,
                  newPiec: chosenPiece,
                  pieceColor: pieceColor),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                    onPressed: startGame,
                    icon: const Center(
                        child: Text(
                      "PLAY",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ))),
                MyButton(
                    onPressed: moveLeft,
                    icon: const Icon(
                      Icons.arrow_left,
                      size: 40,
                    )),
                MyButton(
                    onPressed: moveRight,
                    icon: const Icon(
                      Icons.arrow_right,
                      size: 40,
                    )),
                MyButton(
                    onPressed: restart,
                    icon: const Icon(
                      Icons.rotate_right,
                      size: 40,
                    )),
              ],
            ),
          )
        ],
      )),
    );
  }
}
