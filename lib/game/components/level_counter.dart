import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_shooter_workshop/game/game_engine.dart';

class LevelCounter extends PositionComponent with HasGameRef<SpaceShooterGame> {
  LevelCounter({
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

  int _level = 1;

  int get level {
    return _level;
  }

  void incrementLevel() {
    _setLevel(level + 1);
    if (game.getLevel() == 5) {
      game.gameWin();
    }
  }

  void clear() {
    _setLevel(1);
  }

  void _setLevel(int score) {
    _level = score;
    _text.text = 'Level: $_level';
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
