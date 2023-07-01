import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter_workshop/game/game.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  static MaterialPageRoute route() {
    return MaterialPageRoute<void>(
      builder: (_) => const GamePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const GameWidget.controlled(
      gameFactory: SpaceShooterGame.new,
    );
  }
}
