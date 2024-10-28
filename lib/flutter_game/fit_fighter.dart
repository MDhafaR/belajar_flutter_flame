import 'dart:async';
import 'dart:math';

import 'package:belajar_flutter_flame/component/background_component.dart';
import 'package:belajar_flutter_flame/component/dumbbell_component.dart';
import 'package:belajar_flutter_flame/component/player_skinny_component.dart';
import 'package:belajar_flutter_flame/component/virus_component.dart';
import 'package:belajar_flutter_flame/constant/global.dart';
import 'package:belajar_flutter_flame/inputs/joystick.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class FitFighter extends FlameGame with HasCollisionDetection {
  int score = 0;
  late Timer timer;
  late TextComponent scoreText;
  late int remainingTime;

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
        } else {
          remainingTime--;
        }
      },
    );

    timer.start();

    scoreText = TextComponent(
        text: "Score: $score",
        position: Vector2(50, 50),
        anchor: Anchor.center,
        textRenderer:
            TextPaint(style: TextStyle(color: Colors.black, fontSize: 24)));

    add(scoreText);
  }
}
