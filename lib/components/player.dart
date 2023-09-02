import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:space_shooter_workshop/components/components.dart';
import 'package:space_shooter_workshop/game.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<SpaceShooterGame> {
  Player()
      : super(
          anchor: Anchor.center,
        );

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
    position = gameRef.size / 2;

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
    gameRef.add(
      Shot(
        position: position.clone() -
            Vector2(
              0,
              size.y / 2,
            ),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += _direction * _speed * dt;
  }
}
