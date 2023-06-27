import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:space_shooter_workshop/components/components.dart';

class SpaceShooterGame extends FlameGame with HasKeyboardHandlerComponents {
  SpaceShooterGame()
      : super(
          children: [
            EnemySpawner(),
            Player(),
          ],
        );
}
