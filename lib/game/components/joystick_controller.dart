import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter_workshop/game/components/components.dart';
import 'package:space_shooter_workshop/game/game.dart';

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
    add(joystick);
  }

  @override
  void update(double dt) {
    super.update(dt);
    final delta = firstChild<Player>();
    print(joystick.delta);
    delta?.setJoystickDelta(joystick.delta);
  }
}
