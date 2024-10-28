import 'dart:async';

import 'package:belajar_flutter_flame/component/background_component.dart';
import 'package:belajar_flutter_flame/component/dumbbell_component.dart';
import 'package:belajar_flutter_flame/component/player_skinny_component.dart';
import 'package:belajar_flutter_flame/component/virus_component.dart';
import 'package:belajar_flutter_flame/constant/global.dart';
import 'package:belajar_flutter_flame/inputs/joystick.dart';
import 'package:belajar_flutter_flame/screens/game_over_menu.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class FitFighter extends FlameGame with HasCollisionDetection {
  int dumbbellScore = 0;
  late Timer timer;
  late TextComponent scoreText;
  late TextComponent timeText;
  int remainingTime = 30;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // add digunakan untuk menambahkan komponen
    add(BackgroundComponent());
    add(DumbbellComponent());
    add(VirusComponent(startPosition: Vector2(200, 100)));
    add(VirusComponent(startPosition: Vector2(size.x - 100, size.y - 200)));
    add(PlayerSkinnyComponent(joystickComponent: joystickComponent));
    add(joystickComponent);

    // menambahkan box di layar
    add(ScreenHitbox());

    // digunakan untuk menginisialisasi audio
    FlameAudio.audioCache.loadAll([
      Globals.virusSound,
      Globals.proteinSound,
      Globals.vaccineSound,
      Globals.dumbbellSound
    ]);

    timer = Timer(
      1,
      repeat: true,
      onTick: () {
        if (remainingTime == 0) {
          pauseEngine();
          overlays.add(GameOverMenu.ID);
        } else {
          remainingTime--;
        }
      },
    );

    timer.start();

    scoreText = TextComponent(
        text: "Score: $dumbbellScore",
        position: Vector2(50, 50),
        anchor: Anchor.center,
        textRenderer:
            TextPaint(style: TextStyle(color: Colors.black, fontSize: 24)));

    add(scoreText);

    timeText = TextComponent(
        text: "Time: $remainingTime detik",
        position: Vector2(80, scoreText.height + 50 + 10),
        anchor: Anchor.center,
        textRenderer:
            TextPaint(style: TextStyle(color: Colors.black, fontSize: 24)));

    add(timeText);
  }

  void resetGame() {
    dumbbellScore = 0;
    remainingTime = 30;
    timer.stop();
  }

  @override
  void update(double dt) {
    super.update(dt);
    timer.update(dt);
    scoreText.text = "Score: $dumbbellScore";
    timeText.text = "Time: $remainingTime detik";
  }
}
