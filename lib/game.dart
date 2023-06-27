import 'package:flame/game.dart';
import 'package:space_shooter_workshop/components/components.dart';

class SpaceShooterGame extends FlameGame {
  SpaceShooterGame()
      : super(
          children: [
            Player(),
          ],
        );
}
