import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';
import 'player_info_widget.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/board_background.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: Colors.brown, width: 4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              _buildColoredGrid(),
              _buildPathGrid(),
              _buildHomeGrid(),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: GetBuilder<GameController>(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColoredGrid() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 15,
      ),
      itemCount: 15 * 15,
      itemBuilder: (context, index) {
        final row = index ~/ 15;
        final col = index % 15;
        Color? color;

        if ((row < 6 && col < 6) || (row >= 9 && col < 6) || (row < 6 && col >= 9) || (row >= 9 && col >= 9)) {
            if(row < 6 && col < 6){
               color = Colors.blue.withOpacity(0.2);
            }
            if(row >= 9 && col < 6){
              color = Colors.yellow.withOpacity(0.2);
            }
             if(row < 6 && col >= 9){
              color = Colors.red.withOpacity(0.2);
            }
            if(row >= 9 && col >= 9){
              color = Colors.green.withOpacity(0.2);
            }
        }

        if(row == 7 || col == 7){
           color = Colors.white.withOpacity(0.2);
        }


        return Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black.withOpacity(0.2)),
          ),
        );
      },
    );
  }

  Widget _buildPathGrid() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 15,
      ),
      itemCount: 15 * 15,
      itemBuilder: (context, index) {
        final row = index ~/ 15;
        final col = index % 15;
        Color? color;

        if (row == 0 && (col >= 1 && col <= 5)) {
          color = Colors.white; // Top
        }
        if (row >= 1 && row <= 5 && col == 6) {
          color = Colors.white;
        }
         if (row == 6 && (col >= 1 && col <= 5)) {
          color = Colors.white;
        }
        if (row >= 1 && row <= 5 && col == 0) {
          color = Colors.white; // left
        }
         if (row == 14 && (col >= 9 && col <= 13)) {
          color = Colors.white; // down
        }
         if (row >= 9 && row <= 13 && col == 8) {
          color = Colors.white; 
        }
        if (row == 8 && (col >= 9 && col <= 13)) {
          color = Colors.white; // right
        }
         if (row >= 9 && row <= 13 && col == 14) {
          color = Colors.white;
        }

        if (row == 0 && col == 6) {
          color = Colors.blue;
        }

        if (row == 6 && col == 0) {
          color = Colors.yellow;
        }

        if (row == 8 && col == 14) {
          color = Colors.green;
        }

         if (row == 14 && col == 8) {
          color = Colors.red;
        }



        return Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black.withOpacity(0.2)),
          ),
        );
      },
    );
  }

  Widget _buildHomeGrid() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 15,
      ),
      itemCount: 15 * 15,
      itemBuilder: (context, index) {
        final row = index ~/ 15;
        final col = index % 15;
        Color? color;

        if (row < 6 && col < 6) {
          color = Colors.blue.withOpacity(0.5);
        } else if (row < 6 && col >= 9) {
          color = Colors.red.withOpacity(0.5);
        } else if (row >= 9 && col < 6) {
          color = Colors.yellow.withOpacity(0.5);
        } else if (row >= 9 && col >= 9) {
          color = Colors.green.withOpacity(0.5);
        }


        return Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black.withOpacity(0.2)),
          ),
        );
      },
    );
  }
}