import 'package:flutter/material.dart';
import 'package:glass_calculator/BMI/bottom_button.dart';
import 'package:glass_calculator/BMI/constants.dart';
import 'package:glass_calculator/BMI/reuseable_card.dart';

class Result extends StatefulWidget {
  const Result({super.key,required this.bmiTitle,required this.bmiValue,required this.bmiDescription});
final String bmiTitle;
final String bmiValue;
final String bmiDescription;
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(
            child: Container(padding:const EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
              child:const Text(
                'Your Result',
                style: numberTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container
            (
              padding:const EdgeInsets.all(10),
              child: MyContainer(
                  colour: activeCardColor,
                  cardChild: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text(widget.bmiTitle.toUpperCase(),style: resultTitle,),
                    Text(widget.bmiValue,style: resultValue,),
                    Text(widget.bmiDescription,style: resultMessage,textAlign: TextAlign.center)
                    ],
                  )),
            ),
          ),
          Expanded(child: BottomButton(onTap:() {
        Navigator.pop(context);
      }, title: 'RE-CALCULATE'))
        ],
      ),
    );
  }
}
