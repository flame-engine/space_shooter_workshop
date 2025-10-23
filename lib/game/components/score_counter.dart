import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_shooter_workshop/game/game.dart';

class ScoreCounter extends PositionComponent
    with HasGameReference<SpaceShooterGame> {
  ScoreCounter({super.position}) : super(priority: 20);

  late final TextComponent _text = TextComponent(
    position: Vector2(16, 24),
    textRenderer: TextPaint(
      style: GoogleFonts.pressStart2p(
        color: const Color(0xFFA2FFF3),
        fontSize: 24,
      ),
    ),
  );

  int _score = 0;

  void increment() {
    _setScore(_score + 2);
  }

  void clear() {
    _setScore(0);
  }

  void _setScore(int score) {
    _score = score;
    _text.text = 'Score: $_score';
  }

  @override
  FutureOr<void> onLoad() async {
    final nineTitleBoxSprite = await game.loadSprite(
      'nine_tile_box.png',
    );

    add(
      NineTileBoxComponent(
        nineTileBox: NineTileBox(
          nineTitleBoxSprite,
          tileSize: 16,
        ),
        size: Vector2(240, 64),
      ),
    );
    add(_text);

    clear();
  }
}
