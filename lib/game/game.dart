import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_shooter_workshop/game/components/components.dart';
import 'package:space_shooter_workshop/title_screen.dart';

class SpaceShooterGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  SpaceShooterGame()
      : super(
          children: [
            Background(),
            ScoreCounter(
              position: Vector2(10, 10),
            ),
            ShieldCounter(
              position: Vector2(286, 10),
            ),
            EnemySpawner(),
            Player(),
          ],
        );

  void tookHit() {
    final shieldCounter = firstChild<ShieldCounter>();
    if (shieldCounter != null) {
      final count = shieldCounter.shieldCount;
      if (count == 0) {
        firstChild<Player>()?.removeFromParent();
        add(
          TextComponent(
            text: 'Game Over',
            anchor: Anchor.center,
            position: Vector2(
              size.x / 2,
              size.y / 2,
            ),
            textRenderer: TextPaint(
              style: GoogleFonts.pressStart2p(
                color: const Color(0xFFA2FFF3),
                fontSize: 24,
              ),
            ),
          ),
        );

        add(
          TimerComponent(
            period: 2,
            onTick: () {
              Navigator.of(buildContext!).pushReplacement(TitleScreen.route());
            },
          ),
        );
      } else {
        shieldCounter.removeShield();
      }
    }
  }

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
