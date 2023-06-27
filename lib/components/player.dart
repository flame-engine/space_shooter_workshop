import 'package:flame/components.dart';
import 'package:space_shooter_workshop/game.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<SpaceShooterGame> {
  Player()
      : super(
          anchor: Anchor.center,
        );

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

    size = Vector2.all(96);
    position = gameRef.size / 2;
  }
}
