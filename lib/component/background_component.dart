import 'dart:async';

import 'package:belajar_flutter_flame/constant/global.dart';
import 'package:belajar_flutter_flame/flutter_game/fit_fighter.dart';
import 'package:flame/components.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef<FitFighter> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // digunakan untuk menambahkan background
    sprite = await gameRef.loadSprite(Globals.background);
    // digunakan untuk menentukan ukuran background
    size = gameRef.size;
  }
}
