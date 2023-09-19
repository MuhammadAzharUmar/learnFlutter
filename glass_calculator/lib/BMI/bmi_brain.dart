import 'dart:math';

class BmiBrain {
  BmiBrain({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi=0;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String bmiTitle() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String bmiDescription() {
    if (_bmi >= 25) {
      return 'You have a higher then normal body weight. Try to exercise more.';
    } else if (_bmi > 18) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have lower then normal body weight. You can eat a bit more.';
    }
  }
}
