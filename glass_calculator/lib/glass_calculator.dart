import 'package:flutter/material.dart';
import 'package:glass_calculator/BMI/constants.dart';

class Gcalculator extends StatefulWidget {
  const Gcalculator({super.key});

  @override
  State<Gcalculator> createState() => _GcalculatorState();
}

class _GcalculatorState extends State<Gcalculator> {
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  double result = 0;
  void calculatePrice() {
    double length = double.parse(lengthController.text);
    double width = double.parse(widthController.text);
    double rate = double.parse(rateController.text);
    double size = length * width;
    double size1 = size / 144;
    setState(() {
      result = size1 * rate;
    });
  }
@override
  void dispose() {
        FocusManager.instance.primaryFocus?.unfocus();

    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Enter length and width in inches and rate in per square feet',
                style: labelTextStyle,textAlign: TextAlign.center,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black45,
                ),
                height: 150,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20, top: 10),
                child: Center(
                  child: Text(
                    result.toStringAsFixed(2),
                    style:
                        numberTextStyle,textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              Row(
                children: [
                  MyFields(
                    textt: "length",
                    controller: lengthController,
                  ),
                  const Text(
                    "  X   ",
                    style: TextStyle(fontSize: 30),
                  ),
                  MyFields(
                    textt: "width",
                    controller: widthController,
                  ),
                ],
              ),
              MyFields(
                textt: "rate",
                controller: rateController,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                            lengthController.text="";
                            widthController.text="";
                            rateController.text="";
                            result=0;
                              
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: bottomContainerColor,
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, right: 28, left: 28),
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              elevation: 0),
                          child: const Text(
                            "Clear",
                            style:
                                TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            calculatePrice();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: bottomContainerColor,
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, right: 48, left: 48),
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              elevation: 0),
                          child: const Text(
                            "=",
                            style:
                                TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyFields extends StatelessWidget {
  const MyFields({
    required this.textt,
    required this.controller,
    super.key,
  });
  final String textt;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .3,
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.black45,
        ),
        child: TextField(
          controller: controller,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: textt),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style:const TextStyle( fontSize: 25),
        ));
  }
}
