import 'dart:async';

import 'package:belajar_flutter_flame/constant/global.dart';
import 'package:belajar_flutter_flame/flutter_game/fit_fighter.dart';
import 'package:flame/components.dart';

class PlayerSkinnyComponent extends SpriteComponent
    with HasGameRef<FitFighter> {
  final double _playerSize = 100;
  final double _playerSpeed = 500;

  JoystickComponent joystickComponent;
  PlayerSkinnyComponent({required this.joystickComponent});

  @override
  void update(double dt) {
    super.update(dt);
    // jika joystick tidak di gerakkan oleh user
    if (joystickComponent.direction == JoystickDirection.idle) return;

    // jika joystick di gerakkan oleh user
    position.add(joystickComponent.relativeDelta * _playerSpeed * dt);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // digunakan untuk menambahkan komponen player
    sprite = await gameRef.loadSprite(Globals.playerSkinny);
    // digunakan untuk menentukan ukuran player
    height = width = _playerSize;
    // digunakan untuk menentukan posisi player
    position = gameRef.size / 2;
    // digunakan untuk menentukan anchor
    anchor = Anchor.center;
  }
}
