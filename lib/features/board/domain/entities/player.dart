import 'package:dream_ludo/features/board/domain/entities/token.dart';
import 'package:flutter/material.dart';

class Player {
  final Color color;
  final String name;
  final List<Token> tokens;
  bool isTurn;

  Player({
    required this.color,
    required this.name,
    required this.tokens,
    this.isTurn = false,
  });
}