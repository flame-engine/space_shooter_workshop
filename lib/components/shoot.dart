import 'package:flame/components.dart';
import 'package:space_shooter_workshop/game.dart';

class Shoot extends SpriteAnimationComponent with HasGameRef<SpaceShooterGame> {
  Shoot({
    super.position,
  }) : super(
          anchor: Anchor.center,
        );

  static const _speed = -400.0;

  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'shoot_2.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2.all(16),
      ),
    );

    size = Vector2.all(32);
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += _speed * dt;

    if (position.y + size.y < 0) {
      removeFromParent();
    }
  }
}
