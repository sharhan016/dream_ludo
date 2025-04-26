import 'package:get/get.dart';
import '../features/board/domain/entities/board.dart';
import '../features/board/domain/entities/player.dart';
import '../features/board/domain/usecases/add_player_usecase.dart';
import '../features/board/domain/usecases/initialize_tokens_usecase.dart';
import 'package:flutter/material.dart';

class GameController extends GetxController {
  RxInt gameState = 0.obs;
  late Board board;
  late AddPlayerUseCase addPlayerUseCase;
  late InitializeTokensUseCase initializeTokensUseCase;

 @override
  void onInit() {
    super.onInit();
    board = Board(numberOfCells: 60, players: []);
    addPlayerUseCase = AddPlayerUseCase(board);
  }

  void startGame() {
    List<Player> players = [
        Player(color: Colors.red, name: "Player 1", tokens: []),
        Player(color: Colors.green, name: "Player 2", tokens: []),
        Player(color: Colors.blue, name: "Player 3", tokens: []),
        Player(color: Colors.yellow, name: "Player 4", tokens: []),
      ];
    initializeTokensUseCase = InitializeTokensUseCase();
    for (var player in players) {
      addPlayerUseCase(player);
      initializeTokensUseCase(player);
    }
    gameState.value = 1;
  }
}