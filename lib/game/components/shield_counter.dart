import 'dart:async';
import 'package:flame/components.dart';
import 'package:space_shooter_workshop/game/game_engine.dart';

class ShieldCounter extends PositionComponent
    with HasGameRef<SpaceShooterGame> {
  ShieldCounter({
    super.position,
    this.initialShieldCount = 3,
  }) : super(priority: 20);

  final int initialShieldCount;
  int get shieldCount => children.whereType<SpriteComponent>().length;

  void removeShield() {
    if (shieldCount > 0) {
      children.whereType<SpriteComponent>().last.removeFromParent();
    }
  }

  @override
  FutureOr<void> onLoad() async {
    final energyCell = await gameRef.loadSprite(
      'energy_cell.png',
    );

    final initialPosition = Vector2(
      280,
      16,
    );

    for (var i = 0; i < initialShieldCount; i++) {
      add(
        SpriteComponent(
          sprite: energyCell,
          size: Vector2.all(32),
          position: initialPosition - Vector2(42.0 * i, 0),
        ),
      );
    }
  }
}
