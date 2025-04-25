import '../entities/board.dart';
import '../entities/player.dart';

class AddPlayerUseCase {
  final Board board;

  AddPlayerUseCase(this.board);

  void call(Player player) {
    board.addPlayers([player]);
  }
}