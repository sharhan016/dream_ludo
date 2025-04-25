import '../entities/dice.dart';

class RollDiceUseCase {
  final Dice dice;

  RollDiceUseCase(this.dice);

  int call() {
    dice.roll();
    return dice.currentValue;
  }
}