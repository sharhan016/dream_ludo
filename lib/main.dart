import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/game_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.put(GameController());
    return GetMaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Dream Ludo'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                gameController.startGame();
              },
              child: const Text('Start Game'),
            ),
          )
      ),
    );
  }
}
