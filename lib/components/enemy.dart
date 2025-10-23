import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_shooter_workshop/components/components.dart';
import 'package:space_shooter_workshop/game.dart';

class Enemy extends SpriteAnimationComponent
    with HasGameReference<SpaceShooterGame>, CollisionCallbacks {
  Enemy({super.position}) : super(anchor: Anchor.center);

  static const _speed = 150.0;

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

    position.y += _speed * dt;

    if (position.y >= game.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);
    if (other is Shot) {
      game.add(Explosion(position: position));
      removeFromParent();
      other.removeFromParent();
    }
  }
}

class EnemySpawner extends TimerComponent
    with HasGameReference<SpaceShooterGame> {
  EnemySpawner()
    : super(
        repeat: true,
        period: 1,
        autoStart: true,
      );

  final _random = Random();

  @override
  void onTick() {
    game.add(
      Enemy(
        position: Vector2(_random.nextDouble() * game.size.y, -32),
      ),
    );
  }
}
