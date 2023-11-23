import 'package:flutter/material.dart';
import 'dart:math';

class BmiProvider extends ChangeNotifier {
  double _bmi = -1;

  double get bmi => _bmi;

  void setBmi(double input) {
    _bmi = input;
  }

  String _bmiMessage = '';
  String _bmiStatus = '';

  String get bmiMessage => _bmiMessage;
  String get bmiStatus => _bmiStatus;

  double calculateBMI({
    required double weight,
    required double height,
  }) {
    _bmi = (weight / pow(height / 100, 2));
    if (bmi <= 18.5) {
      _bmiStatus = 'underweight';
      _bmiMessage = 'underweightMessage';
    } else if(bmi <= 24.9) {
      _bmiStatus = 'normal';
      _bmiMessage = 'normalMessage';
    } else if(bmi <= 29.9) {
      _bmiStatus = 'overweight';
      _bmiMessage = 'overweightMessage';
    } else if(bmi <= 39.9) {
      _bmiStatus = 'obese';
      _bmiMessage = 'obeseMessage';
    }
    return bmi;
  }
}