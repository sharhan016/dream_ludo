import '../entities/player.dart';

class CheckWinUseCase {
  final Player player;

  CheckWinUseCase(this.player);

  bool call() {
    return player.tokens.every((token) => token.isFinished);
  }
}