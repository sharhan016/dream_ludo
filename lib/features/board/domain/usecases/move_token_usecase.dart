import '../entities/token.dart';

class MoveTokenUseCase {
  final Token token;

  MoveTokenUseCase(this.token);

  void call(int steps) {
    if (token.isAtHome) {
      if (steps == 6) {
        token.moveTo(1);
      }
    } else {
      token.moveTo(token.position + steps);
    }
  }
}