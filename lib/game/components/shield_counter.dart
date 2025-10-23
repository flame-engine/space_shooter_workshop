import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_shooter_workshop/game/game.dart';

class ShieldCounter extends PositionComponent
    with HasGameReference<SpaceShooterGame> {
  ShieldCounter({
    super.position,
    this.initialShieldCount = 3,
  }) : super(priority: 20);

  final int initialShieldCount;
  late final TextComponent _text = TextComponent(
    position: Vector2(16, 24),
    text: 'Shield:',
    textRenderer: TextPaint(
      style: GoogleFonts.pressStart2p(
        color: const Color(0xFFA2FFF3),
        fontSize: 24,
      ),
    ),
  );

  int get shieldCount => children.whereType<SpriteComponent>().length;

  void removeShield() {
    if (shieldCount > 0) {
      children.whereType<SpriteComponent>().last.removeFromParent();
    }
  }

  @override
  FutureOr<void> onLoad() async {
    final nineTitleBoxSprite = await game.loadSprite(
      'nine_tile_box.png',
    );

    final energyCell = await game.loadSprite(
      'energy_cell.png',
    );

    add(
      NineTileBoxComponent(
        nineTileBox: NineTileBox(
          nineTitleBoxSprite,
          tileSize: 16,
        ),
        size: Vector2(340, 64),
      ),
    );
    add(_text);

    final initialPosition = Vector2(
      280,
      16,
    );

    for (var i = 0; i < initialShieldCount; i++) {
      add(
        SpriteComponent(
          sprite: energyCell,
          size: Vector2.all(32),
          position: initialPosition - Vector2(42.0 * i, 0),
        ),
      );
    }
  }
}
