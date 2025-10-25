import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:space_shooter_workshop/components/components.dart';

class SpaceShooterGame extends FlameGame
    with MouseMovementDetector, TapCallbacks {
  SpaceShooterGame() : player = Player() {
    add(player);
  }

  final Player player;

  @override
  void onMouseMove(PointerHoverInfo event) {
    player.position = event.eventPosition.global;
  }

  @override
  void onTapDown(TapDownEvent event) {}
}
