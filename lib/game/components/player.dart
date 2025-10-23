import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:space_shooter_workshop/game/components/components.dart';
import 'package:space_shooter_workshop/game/game.dart';

class Player extends SpriteAnimationComponent
    with HasGameReference<SpaceShooterGame>, CollisionCallbacks {
  Player() : super(anchor: Anchor.center);

  static const _speed = 400.0;
  final _direction = Vector2.zero();

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
    position = game.size / 2;

    add(
      RectangleHitbox.relative(
        Vector2(0.8, 0.8),
        parentSize: size,
      ),
    );

    add(
      KeyboardListenerComponent(
        keyUp: {
          LogicalKeyboardKey.keyA: (_) {
            _direction.x = 0;
            return false;
          },
          LogicalKeyboardKey.keyD: (_) {
            _direction.x = 0;
            return false;
          },
          LogicalKeyboardKey.keyW: (_) {
            _direction.y = 0;
            return false;
          },
          LogicalKeyboardKey.keyS: (_) {
            _direction.y = 0;
            return false;
          },
          LogicalKeyboardKey.space: (_) {
            _shoot();
            return false;
          },
        },
        keyDown: {
          LogicalKeyboardKey.keyA: (_) {
            _direction.x = -1;
            return false;
          },
          LogicalKeyboardKey.keyD: (_) {
            _direction.x = 1;
            return false;
          },
          LogicalKeyboardKey.keyW: (_) {
            _direction.y = -1;
            return false;
          },
          LogicalKeyboardKey.keyS: (_) {
            _direction.y = 1;
            return false;
          },
          LogicalKeyboardKey.space: (_) => false,
        },
      ),
    );
  }

  void _shoot() {
    game.add(
      Shot(
        position: position - Vector2(0, size.y / 2),
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

    position += _direction * _speed * dt;
  }
}
