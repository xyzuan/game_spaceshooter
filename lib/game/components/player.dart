import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:get/get.dart';
import 'package:space_shooter_workshop/game/components/components.dart';
import 'package:space_shooter_workshop/game/game_engine.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<SpaceShooterGame>, CollisionCallbacks {
  Player()
      : super(
          anchor: Anchor.center,
        );

  static const _speed = 10.0;

  get name => null;

  get score => null;

  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'starfighter_2.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.2,
        textureSize: Vector2.all(48),
      ),
    );

    add(
      RectangleHitbox.relative(
        Vector2(0.8, 0.8),
        parentSize: size,
      ),
    );

    size = Vector2.all(96);
    position = gameRef.size / 2;
  }

  void shoot() {
    gameRef.add(
      Shot(
        position: position.clone() -
            Vector2(
              0,
              size.y / 2,
            ),
      ),
    );
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);
    if (other is Enemy) {
      other.removeFromParent();
      game.add(Explosion(position: position));
      game.tookHit();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    Vector2 newPosition = position + game.joystickHandler() * _speed * dt;

    double newX = newPosition.x.clamp(0, Get.width);
    double newY = newPosition.y.clamp(0, Get.height);

    position = Vector2(newX, newY);
  }
}
