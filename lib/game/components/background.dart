import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/widgets.dart';
import 'package:space_shooter_workshop/game/game.dart';

class Background extends ParallaxComponent<SpaceShooterGame> {
  @override
  FutureOr<void> onLoad() async {
    //parallax = await game.loadParallax(
    //  [
    //    ParallaxImageData('background_nebula.png'),
    //    ParallaxImageData('background_stars_1.png'),
    //    ParallaxImageData('background_stars_2.png'),
    //    ParallaxImageData('background_stars_3.png'),
    //  ],
    //  baseVelocity: Vector2(0, -1),
    //  velocityMultiplierDelta: Vector2(0, 4.0),
    //  repeat: ImageRepeat.repeat,
    //);

    // TODO(erickzanardo): Use the above API when
    // is merged: https://github.com/flame-engine/flame/pull/2596
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
        .map((e) => ParallaxLayer(e, velocityMultiplier: Vector2(0, 4.0)))
        .toList();

    parallax = Parallax(layers, baseVelocity: Vector2(0, -1));

    size = game.size.clone();
  }
}
