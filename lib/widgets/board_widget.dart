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
              const Expanded(
                child: Stack(
                  children: [
                     Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Quadrant(color: Colors.blue, index: 0,),
                              ),                                
                              Expanded(
                                child: Quadrant(color: Colors.red, index: 1),
                              ),                              
                            ],
                          ), 
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded( 
                                child: Quadrant(color: Colors.yellow, index: 2),                              
                              ),
                              Expanded( 
                                child: Quadrant(color: Colors.green, index: 3),                                
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
  final int index;
  const Quadrant({Key? key, required this.color, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.find();
      final screenWidth = MediaQuery.of(context).size.width;
    final quadrantSize = screenWidth / 2.2;
    final tokenSize = 40.0;
    const tokenMargin = 20;
    final tokenWithMargin = tokenSize + tokenMargin;

    return SizedBox(
      width: quadrantSize,
      height: quadrantSize,
      child: Container(
        color: color,
        child: Stack(
          children: [
            ...gameController.board.players.expand((player) =>
                player.tokens.asMap().entries.map((entry) {
                  final int tokenIndex = entry.key;
                  final token = entry.value;
                  if (token.color == color) {
                    double left = (tokenIndex % 2) * tokenWithMargin + tokenMargin;
                    double top = (tokenIndex ~/ 2) * tokenWithMargin + tokenMargin;
                    
                    final centerOffsetX = (quadrantSize - (tokenSize + tokenMargin) * 2) / 2 ;
                    final centerOffsetY = (quadrantSize - (tokenSize + tokenMargin) * 2) / 2 ;

                    left += centerOffsetX;
                    top += centerOffsetY;
                    return Positioned(
                      left: left,
                      top: top,
                      child: TokenWidget(token: token),
                    );
                  } else {
                    return Container();
                  }
                })).toList()
          ],
        ),
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