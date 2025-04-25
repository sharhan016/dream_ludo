import 'package:flutter/material.dart';

class Token {
  final Color color;
  final String id;
  int position;
  bool isAtHome;
  bool isFinished;

  Token({
    required this.color,
    required this.id,
    this.position = 0,
    this.isAtHome = true,
    this.isFinished = false,
  });

  void moveTo(int newPosition) {
    position = newPosition;
    isAtHome = false;
  }
}