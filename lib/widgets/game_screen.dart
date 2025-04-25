import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';
import 'board_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.find();
    return Obx(
      () => gameController.gameState.value == 0
          ? Center(
              child: ElevatedButton(
                onPressed: () {
                  gameController.startGame();
                },
                child: const Text('Start Game'),
              ),
            )
          : const BoardWidget(),
    );
  }
}