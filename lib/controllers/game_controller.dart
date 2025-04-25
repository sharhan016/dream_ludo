import 'package:get/get.dart';
import '../features/board/domain/entities/board.dart';
import '../features/board/domain/entities/player.dart';
import '../features/board/domain/usecases/add_player_usecase.dart';
import '../features/board/domain/usecases/initialize_tokens_usecase.dart';
import 'package:flutter/material.dart';

class GameController extends GetxController {
  late Board board;
  late AddPlayerUseCase addPlayerUseCase;
  late InitializeTokensUseCase initializeTokensUseCase;

  void startGame() {
    board = Board(numberOfCells: 60, players: []);
    addPlayerUseCase = AddPlayerUseCase(board);
    List<Player> players = [
      Player(color: Colors.red, name: "Player 1", tokens: []),
      Player(color: Colors.green, name: "Player 2", tokens: []),
      Player(color: Colors.blue, name: "Player 3", tokens: []),
      Player(color: Colors.yellow, name: "Player 4", tokens: []),
    ];

    for (var player in players) {
      addPlayerUseCase(player);
    }
    for(var player in board.players){
      initializeTokensUseCase = InitializeTokensUseCase(player);
      initializeTokensUseCase();
    }
  }
}