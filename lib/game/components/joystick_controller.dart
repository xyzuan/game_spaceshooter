import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter_workshop/game/game_engine.dart';

class JoystickController extends PositionComponent
    with HasGameRef<SpaceShooterGame> {
  JoystickController() : super(priority: 20);

  final joystick = JoystickComponent(
    anchor: Anchor.bottomLeft,
    position: Vector2(28, 820),
    size: 100,
    background: CircleComponent(
      radius: 60,
      paint: Paint()..color = Colors.white.withOpacity(0.5),
    ),
    knob: CircleComponent(radius: 30),
  );

  @override
  FutureOr<void> onLoad() async {
    final nineTitleBoxSprite = await gameRef.loadSprite(
      'nine_tile_box.png',
    );

    add(joystick);
    add(
      SpriteButtonComponent(
          onPressed: () => game.fireHandler(),
          button: nineTitleBoxSprite,
          size: Vector2(80, 80),
          position: Vector2(280, 720)),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
