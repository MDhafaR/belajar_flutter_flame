import 'dart:async';

import 'package:belajar_flutter_flame/constant/global.dart';
import 'package:belajar_flutter_flame/flutter_game/fit_fighter.dart';
import 'package:flame/components.dart';

class PlayerSkinnyComponent extends SpriteComponent
    with HasGameRef<FitFighter> {
  final double playerSize = 100;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // digunakan untuk menambahkan komponen player
    sprite = await gameRef.loadSprite(Globals.playerSkinny);
    // digunakan untuk menentukan ukuran player
    height = width = playerSize;
    // digunakan untuk menentukan posisi player
    position = gameRef.size / 2;
    // digunakan untuk menentukan anchor
    anchor = Anchor.center;
  }
}
