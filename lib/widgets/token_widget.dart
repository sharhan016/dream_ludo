import 'package:flutter/material.dart';
import '../features/board/domain/entities/token.dart';

class TokenWidget extends StatelessWidget {
  final Token token;

  const TokenWidget({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: token.color,
      ),
      child: Center(
        child: Text(
          token.id,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}