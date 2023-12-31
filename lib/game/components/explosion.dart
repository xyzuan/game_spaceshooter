import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:space_shooter_workshop/game/game_engine.dart';

class Explosion extends SpriteAnimationComponent
    with HasGameRef<SpaceShooterGame> {
  Explosion({
    super.position,
  }) : super(
          anchor: Anchor.center,
          removeOnFinish: true,
        );

  @override
  Future<void> onLoad() async {
    FlameAudio.play('explode.mp3');
    animation = await game.loadSpriteAnimation(
      'purple_explosion.png',
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: 0.1,
        textureSize: Vector2.all(32),
        loop: false,
      ),
    );

    size = Vector2.all(64);
  }
}
