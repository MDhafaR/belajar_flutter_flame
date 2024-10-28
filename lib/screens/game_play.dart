import 'package:belajar_flutter_flame/flutter_game/fit_fighter.dart';
import 'package:belajar_flutter_flame/screens/game_over_menu.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GamePlay extends StatelessWidget {
  const GamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    final FitFighter game = FitFighter();
    return GameWidget(
      game: game,
      overlayBuilderMap: {
        GameOverMenu.ID: (context, FitFighter gameRef) => GameOverMenu(
              gameRef: gameRef,
            )
      },
    );
  }
}
