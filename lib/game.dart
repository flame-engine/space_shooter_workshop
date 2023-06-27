import 'package:flame/components.dart';
import 'package:flame/game.dart';

class SpaceShooterGame extends FlameGame {
  SpaceShooterGame()
      : super(
          children: [
            TextComponent(
              text: 'Hello Flame World',
            ),
          ],
        );
}
