import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/widgets.dart';
import 'package:space_shooter_workshop/game/game_engine.dart';
import 'package:flame_audio/flame_audio.dart';


class Background extends ParallaxComponent<SpaceShooterGame> {
  @override
  FutureOr<void> onLoad() async {
    FlameAudio.bgm.play('musicbg.mp3');
    final parallaxImages = await Future.wait([
      game.loadParallaxImage(
        'background_nebula.png',
        filterQuality: FilterQuality.none,
        repeat: ImageRepeat.repeat,
      ),
      game.loadParallaxImage(
        'background_stars_1.png',
        filterQuality: FilterQuality.none,
        repeat: ImageRepeat.repeat,
      ),
      game.loadParallaxImage(
        'background_stars_2.png',
        filterQuality: FilterQuality.none,
        repeat: ImageRepeat.repeat,
      ),
      game.loadParallaxImage(
        'background_stars_3.png',
        filterQuality: FilterQuality.none,
        repeat: ImageRepeat.repeat,
      ),
    ]);

    final layers = parallaxImages
        .map(
          (e) => ParallaxLayer(
            e,
            velocityMultiplier: Vector2(0, 4.0),
          ),
        )
        .toList();

    parallax = Parallax(layers, baseVelocity: Vector2(0, -1));

    size = game.size.clone();
  }
}
