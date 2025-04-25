

import 'package:dream_ludo/features/board/domain/entities/player.dart';

class Board {
  final int numberOfCells;
  List<Player> players;

  Board({required this.numberOfCells, required this.players}) {
    _createBoard();
  }

  void _createBoard() {
    if (numberOfCells != 60) {
      throw ArgumentError("Board must have 60 cells.");
    }
  }

  void addPlayers(List<Player> players) {
    this.players.addAll(players);
  }
}