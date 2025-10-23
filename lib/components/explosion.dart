import 'package:flame/components.dart';
import 'package:space_shooter_workshop/game.dart';

class Explosion extends SpriteAnimationComponent
    with HasGameReference<SpaceShooterGame> {
  Explosion({super.position})
    : super(anchor: Anchor.center, removeOnFinish: true);

  @override
  Future<void> onLoad() async {
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
