import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter_workshop/game.dart';

void main() {
  runApp(
    const GameWidget.controlled(
      gameFactory: SpaceShooterGame.new,
    ),
  );
}
