import 'dart:async';
import 'dart:math';

import 'package:belajar_flutter_flame/component/background_component.dart';
import 'package:belajar_flutter_flame/component/dumbbell_component.dart';
import 'package:belajar_flutter_flame/component/player_skinny_component.dart';
import 'package:belajar_flutter_flame/component/virus_component.dart';
import 'package:belajar_flutter_flame/constant/global.dart';
import 'package:belajar_flutter_flame/inputs/joystick.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';

class FitFighter extends FlameGame with HasCollisionDetection {

  Vector2 _randomPosition() {
    double x = Random().nextInt(300 - 50).toDouble();
    double y = Random().nextInt(200 - 50).toDouble();
    return Vector2(x, y);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // add digunakan untuk menambahkan komponen
    add(BackgroundComponent());
    add(DumbbellComponent());
    add(VirusComponent(startPosition: _randomPosition()));
    add(VirusComponent(startPosition: _randomPosition()));
    add(PlayerSkinnyComponent(joystickComponent: joystickComponent));
    add(joystickComponent);

    // digunakan untuk menginisialisasi audio
    FlameAudio.audioCache.loadAll([
      Globals.virusSound,
      Globals.proteinSound,
      Globals.vaccineSound,
      Globals.dumbbellSound
    ]);
  }
}
