import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_shooter_workshop/game/game.dart';
import 'package:space_shooter_workshop/game/game_controller.dart';

class GameScreen extends GetView<GameController> {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GameWidget.controlled(
      gameFactory: SpaceShooterGame.new,
    );
  }
}
