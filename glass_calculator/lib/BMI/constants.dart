import 'package:flutter/material.dart';
//some constants
const bottomContainerColor = Color(0xffEB1555);
const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xff1D1E33);
const inActiveCardColor = Color(0xff111328);
const cardTextColor = Color(0xff8D8E98);
const labelTextStyle= TextStyle(fontSize: 18, color: cardTextColor);
const numberTextStyle= TextStyle(fontSize: 50, color: Colors.white,fontWeight: FontWeight.bold);
const bottomContainerTextStyle= TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold);
const resultTitle= TextStyle(fontSize: 22, color: Color(0xff24D876),fontWeight: FontWeight.bold);
const resultValue= TextStyle(fontSize: 100, fontWeight: FontWeight.bold);
const resultMessage= TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
//enum for gender detection
enum Gender{
  male,
  female,
}