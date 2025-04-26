import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class DiceWidget extends StatelessWidget {
  final RxInt diceNumber = 1.obs;

  DiceWidget({Key? key}) : super(key: key);

  void rollDice() {
    diceNumber.value = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: rollDice,
      child: Obx(
        () => Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              diceNumber.value.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}