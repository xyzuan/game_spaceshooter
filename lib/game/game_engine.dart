import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_shooter_workshop/game/components/components.dart';
import 'package:space_shooter_workshop/routes/pages_name.dart';

class SpaceShooterGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  SpaceShooterGame()
      : super(
          children: [
            Background(),
            JoystickController(),
            ScoreCounter(
              position: Vector2(10, 20),
            ),
            ShieldCounter(
              position: Vector2(220, 20),
            ),
            EnemySpawner(),
            Player(),
          ],
        );

  Vector2 joystickHandler() {
    final joystick = firstChild<JoystickController>();
    return joystick!.joystick.delta;
  }

  void fireHandler() {
    final player = firstChild<Player>();
    player?.shoot();
  }

  void tookHit() {
    final shieldCounter = firstChild<ShieldCounter>();
    if (shieldCounter != null) {
      final count = shieldCounter.shieldCount;
      if (count == 0) {
        firstChild<Player>()?.removeFromParent();
        add(
          TextComponent(
            text: 'Game Over',
            anchor: Anchor.center,
            position: Vector2(
              size.x / 2,
              size.y / 2,
            ),
            textRenderer: TextPaint(
              style: GoogleFonts.pressStart2p(
                color: const Color(0xFFA2FFF3),
                fontSize: 24,
              ),
            ),
          ),
        );

        add(
          TimerComponent(
            period: 2,
            onTick: () {
              Get.offAndToNamed(PageName.title);
            },
          ),
        );
      } else {
        shieldCounter.removeShield();
      }
    }
  }

  void restartGame() {
    add(Player());

    final scoreCounter = firstChild<ScoreCounter>();
    scoreCounter?.clear();
  }

  void increaseScore() {
    final scoreCounter = firstChild<ScoreCounter>();
    scoreCounter?.increment();
  }
}
