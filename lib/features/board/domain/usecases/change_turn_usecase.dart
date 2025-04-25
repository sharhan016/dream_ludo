import '../entities/board.dart';

class ChangeTurnUseCase {
  final Board board;

  ChangeTurnUseCase(this.board);

  void call() {
    if (board.players.isEmpty) return;

    int currentTurnIndex = board.players.indexWhere((player) => player.isTurn);

    if (currentTurnIndex == -1) {
      board.players[0].isTurn = true;
      return;
    }

    board.players[currentTurnIndex].isTurn = false;

    int nextTurnIndex = (currentTurnIndex + 1) % board.players.length;
    board.players[nextTurnIndex].isTurn = true;
  }
}