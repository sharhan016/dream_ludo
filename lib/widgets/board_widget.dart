import 'package:dream_ludo/widgets/player_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';
import 'token_widget.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.brown, width: 4),
          ),
          child: Column(
            children: [
              GetBuilder<GameController>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...controller.board.players.map((player) => PlayerInfoWidget(player: player)).toList(),
                      ],
                    ),
                  );
                }
              ),
              Expanded(
                child: Stack(
                  children: [
                    const Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Quadrant(color: Colors.blue),
                              ),
                              Expanded(
                                child: Quadrant(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Quadrant(color: Colors.yellow),
                              ),
                              Expanded(
                                child: Quadrant(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const CenterTriangles()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CenterTriangles extends StatelessWidget {
  const CenterTriangles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.width / 3,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomPaint(
                      painter: TrianglePainter(Colors.blue),
                    ),
                  ),
                  Expanded(
                    child: CustomPaint(
                      painter: TrianglePainter(Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomPaint(
                      painter: TrianglePainter(Colors.yellow),
                    ),
                  ),
                  Expanded(
                    child: CustomPaint(
                      painter: TrianglePainter(Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Quadrant extends StatelessWidget {
  final Color color;
  const Quadrant({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.find();

    return Container(
      color: color,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.5),
              ),
            ),
          ),
          ...gameController.board.players.expand((player) => player.tokens.map((token) {
              if (token.color == color) {
                return Positioned(
                  left: 10,
                  top: 10,
                  child: TokenWidget(token: token,),
                );
              } else {
                return Container();
              }
            })).toList()
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;
  TrianglePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color;

    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}