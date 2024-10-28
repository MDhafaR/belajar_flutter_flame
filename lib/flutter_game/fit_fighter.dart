import 'dart:async';

import 'package:belajar_flutter_flame/component/background_component.dart';
import 'package:belajar_flutter_flame/component/player_skinny_component.dart';
import 'package:flame/game.dart';

class FitFighter extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    // add digunakan untuk menambahkan komponen
    add(BackgroundComponent());
    add(PlayerSkinnyComponent());
  }
}
