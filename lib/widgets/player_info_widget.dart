import 'package:flutter/material.dart';
import '../features/board/domain/entities/player.dart';

class PlayerInfoWidget extends StatelessWidget {
  final Player player;

  const PlayerInfoWidget({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: player.color,
          ),
        ),
        const SizedBox(width: 8),
        Text(player.name),
      ],
    );
  }
}