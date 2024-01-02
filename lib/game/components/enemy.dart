import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_shooter_workshop/game/components/components.dart';
import 'package:space_shooter_workshop/game/game_engine.dart';

class Enemy extends SpriteAnimationComponent
    with HasGameRef<SpaceShooterGame>, CollisionCallbacks {
  Enemy({
    super.position,
  }) : super(
          anchor: Anchor.center,
        );

  int getSpeed(int level) {
    if (level == 2) {
      return 300;
    } else if (level == 3) {
      return 450;
    } else if (level == 4) {
      return 550;
    } else if (level == 5) {
      return 550;
    } else {
      return 150;
    }
  }

  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'alien_1.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.25,
        textureSize: Vector2.all(16),
      ),
    );

    size = Vector2.all(32);

    add(
      RectangleHitbox.relative(
        Vector2(0.8, 0.8),
        parentSize: size,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += getSpeed(game.getLevel()) * dt;
    if (position.y >= gameRef.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);
    if (other is Shot) {
      game.add(Explosion(position: position));
      game.increaseScore();
      if (game.getScore() % 10 == 0 && game.getScore() != 0) {
        game.increaseLevel();
      }
      removeFromParent();
      other.removeFromParent();
    }
  }
}

class EnemySpawner extends TimerComponent with HasGameRef<SpaceShooterGame> {
  EnemySpawner()
      : super(
          repeat: true,
          period: 1,
          autoStart: true,
        );

  final _random = Random();

  @override
  void onTick() {
    gameRef.add(
      Enemy(
        position: Vector2(
          _random.nextDouble() * gameRef.size.y,
          -32,
        ),
      ),
    );
  }
}
