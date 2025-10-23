import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreCounter extends TextComponent {
  ScoreCounter({super.position}) : super(priority: 20);

  int _score = 0;

  void increment() {
    _setScore(_score + 2);
  }

  void clear() {
    _setScore(0);
  }

  void _setScore(int score) {
    _score = score;
    text = 'Score: $_score';
  }

  @override
  FutureOr<void> onLoad() async {
    textRenderer = TextPaint(
      style: GoogleFonts.pressStart2p(
        color: const Color(0xFFA2FFF3),
        fontSize: 24,
      ),
    );

    clear();
  }
}
