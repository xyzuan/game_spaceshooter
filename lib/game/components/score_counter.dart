import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_shooter_workshop/game/game_engine.dart';

class ScoreCounter extends PositionComponent with HasGameRef<SpaceShooterGame> {
  ScoreCounter({
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

  int _score = 0;

  int get score {
    return _score;
  }

  void increment() {
    _setScore(_score + 2);
  }

  void clear() {
    _setScore(0);
  }

  void _setScore(int score) {
    _score = score;
    _text.text = 'Score: $_score';
  }

  @override
  FutureOr<void> onLoad() async {
    final nineTitleBoxSprite = await gameRef.loadSprite(
      'nine_tile_box.png',
    );

    add(
      NineTileBoxComponent(
        nineTileBox: NineTileBox(
          nineTitleBoxSprite,
          tileSize: 16,
        ),
        size: Vector2(180, 64),
      ),
    );
    add(_text);

    clear();
  }
}
