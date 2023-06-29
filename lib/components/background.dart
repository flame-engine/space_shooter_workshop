import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/widgets.dart';
import 'package:space_shooter_workshop/game.dart';

class Background extends ParallaxComponent<SpaceShooterGame> {
  @override
  FutureOr<void> onLoad() async {
    parallax = await game.loadParallax(
      [
        ParallaxImageData('background_nebula.png'),
        ParallaxImageData('background_stars_1.png'),
        ParallaxImageData('background_stars_2.png'),
        ParallaxImageData('background_stars_3.png'),
      ],
      baseVelocity: Vector2(0, -1),
      velocityMultiplierDelta: Vector2(0, 4.0),
      repeat: ImageRepeat.repeat,
    );

    size = gameRef.size.clone();
  }
}
