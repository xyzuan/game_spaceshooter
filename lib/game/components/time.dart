import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_shooter_workshop/game/game_engine.dart';

class Time extends PositionComponent with HasGameRef<SpaceShooterGame> {
  Time({
    super.position,
  }) : super(priority: 20);

  late final TextComponent _text = TextComponent(
    position: Vector2(16, 24),
    textRenderer: TextPaint(
      style: GoogleFonts.pressStart2p(
        color: const Color(0xFFA2FFF3),
        fontSize: 16,
      ),
    ),
  );

  @override
  void update(double dt) {
    super.update(dt);
    _setTime(_time += dt);
  }

  double _time = 1;

  double get time {
    return _time;
  }

  void clear() {
    _setTime(0.0);
  }

  void _setTime(double time) {
    _time = time;
    _text.text = _time.toStringAsFixed(1);
  }

  FutureOr<void> onLoad() async {
    add(_text);
    clear();
  }
}
