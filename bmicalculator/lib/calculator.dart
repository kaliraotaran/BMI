import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double bmi = 0.0;

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (bmi >= 25) {
      return 'overweight';
    } else if (bmi > 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi > 0 && bmi < 18.5) {
      return 'underweight';
    } else {
      return '';
    }
  }

  String getinterpretation() {
    if (bmi >= 25) {
      return "you should start dieting and cutting calories";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Keep doing what you\'r doing, its going great for you";
    } else if (bmi > 0 && bmi < 18.5) {
      return "Wow, you shoud start eating more and have a caloric surplus";
    } else {
      return '';
    }
  }
}
