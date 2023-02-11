import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var displayText = "";
  Widget btn(var textt) {
    return Expanded(
      flex: 4,
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              displayText = displayText + textt;
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              padding: MaterialStateProperty.all(const EdgeInsets.all(32)),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 30))),
          child: Text(textt)),
    );
  }

  void clear() {
    setState(() {
      displayText = "";
    });
  }

  void dec() {
    setState(() {
      String s = "";
      for (int i = 0; i < displayText.length - 1; i++) {
        s = s + displayText[i];
      }
      displayText = s;
    });
  }

  eval() {
    String output = "";
    for (int i = 0; i < displayText.length; i++) {
      if (displayText[i] == "÷") {
        output = "$output/";
      } else if (displayText[i] == "×") {
        output = "$output*";
      } else {
        output = output + displayText[i];
      }
    }
    Parser p = Parser();
    Expression exp = p.parse(output);
    ContextModel cm = ContextModel();
    double evl = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      displayText = evl.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.vertical,
                child: Text(
                  displayText,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.amber),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                      onPressed: clear,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(32)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 30))),
                      child: const Text("C")),
                ),
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                      onPressed: dec,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(30)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 30))),
                      child: const Image(
                        image: AssetImage('assets/clr.png'),
                        color: Colors.white,
                      )),
                ),
                btn("%"),
                btn("÷"),
              ],
            ),
            Row(
              children: [
                btn("7"),
                btn("8"),
                btn("9"),
                btn("×"),
              ],
            ),
            Row(
              children: [
                btn("4"),
                btn("5"),
                btn("6"),
                btn("-"),
              ],
            ),
            Row(
              children: [
                btn("1"),
                btn("2"),
                btn("3"),
                btn("+"),
              ],
            ),
            Row(
              children: [
                btn("00"),
                btn("0"),
                btn("."),
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                      onPressed: eval,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(32)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 30))),
                      child: const Text("=")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
