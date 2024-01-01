import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/text.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:get/get.dart';
import 'package:space_shooter_workshop/game/components/components.dart';
import 'package:space_shooter_workshop/routes/pages_name.dart';

class LeaderboardComponent extends PositionComponent {
  final List<Player> leaderboard;
  final double fontSize;

  LeaderboardComponent({
    required this.leaderboard,
    required this.fontSize,
  });

  @override
  void render(Canvas c) {
    super.render(c);
    renderLeaderboard(c);
  }

  void renderLeaderboard(Canvas c) {
    final textStyle = TextPaint(
      style: TextStyle(
        color: const Color(0xFFA2FFF3),
        fontSize: fontSize,
      ),
    );

    final textConfig = TextConfig(textRenderer: textStyle);

    textConfig.render(
      c,
      'Leaderboard',
      position: Vector2(size.x / 2, 10),
      anchor: Anchor.topCenter,
    );

    for (var i = 0; i < leaderboard.length; i++) {
      final player = leaderboard[i];
      textConfig.render(
        c,
        '${i + 1}. ${player.name}: ${player.score}',
        position: Vector2(size.x / 2, 30 + i * 20),
        anchor: Anchor.topCenter,
      );
    }
  }

  TextConfig({required TextPaint textRenderer}) {}
}

class SpaceShooterGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  List<Player> leaderboard = [];

  SpaceShooterGame()
      : super(
          children: [
            Background(),
            JoystickController(),
            ShieldCounter(position: Vector2(75, 42)),
            ScoreCounter(position: Vector2(10, 40)),
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
        FlameAudio.bgm.stop();
        FlameAudio.play('gameover.mp3');
        add(
          TextComponent(
            text: 'Game Over',
            anchor: Anchor.center,
            position: Vector2(
              size.x / 2,
              size.y / 2,
            ),
            textRenderer: TextPaint(
              style: const TextStyle(
                color: Color(0xFFA2FFF3),
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

        // Display leaderboard
        add(
          LeaderboardComponent(
            leaderboard: leaderboard,
            fontSize: 16,
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
