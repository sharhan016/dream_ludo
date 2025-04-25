import 'dart:math';

class Dice {
  final int numberOfSides;
  int currentValue;

  Dice({this.numberOfSides = 6}) : currentValue = 1;

  void roll() {
    currentValue = Random().nextInt(numberOfSides) + 1;
  }
}