import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:space_shooter_workshop/components/components.dart';
import 'package:space_shooter_workshop/components/score_counter.dart';

class SpaceShooterGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  SpaceShooterGame()
      : super(
          children: [
            Background(),
            ScoreCounter(
              position: Vector2(10, 10),
            ),
            EnemySpawner(),
            Player(),
          ],
        );

  void restartGame() {
    add(Player());

    final scoreCounter = firstChild<ScoreCounter>();
    scoreCounter?.clear();
  }

  void increaseScore() {
    final scoreCounter = firstChild<ScoreCounter>();
    scoreCounter?.increment();
  }
}
