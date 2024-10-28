import 'dart:async';

import 'package:belajar_flutter_flame/constant/global.dart';
import 'package:belajar_flutter_flame/flutter_game/fit_fighter.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class PlayerSkinnyComponent extends SpriteComponent
    with HasGameRef<FitFighter>, CollisionCallbacks {
  final double _playerSize = 100;
  final double _playerSpeed = 500;

  // penanganan maksimal posisi player
  late double _topBound;
  late double _bottomBound;
  late double _leftBound;
  late double _rightBound;

  JoystickComponent joystickComponent;
  PlayerSkinnyComponent({required this.joystickComponent});

  @override
  void update(double dt) {
    super.update(dt);
    // jika joystick tidak di gerakkan oleh user
    if (joystickComponent.direction == JoystickDirection.idle) return;

    // jika joystick di gerakkan oleh user
    position.add(joystickComponent.relativeDelta * _playerSpeed * dt);

    // logika maksimal posisi player
    // dengan kita menggunakan logika seperti ini maka akan ada pembatas untuk maksimal x dan y atau kanan kiri atas bawah
    // x atau y itu adalah posisi dari player kita, jadi
    // kalau player(x) lebih atau sama dengan berada pada _rightBound maka player kita dipaksa untuk diam dan tidak bisa melebihi _rightBound tersebut
    if (x >= _rightBound) {
      x = _rightBound;
    }
    if (x <= _leftBound) {
      x = _leftBound;
    }
    if (y <= _topBound) {
      y = _topBound;
    }
    if (y >= _bottomBound) {
      y = _bottomBound;
    }
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

    // atas layar itu adalah y = 0, bawah layar itu maksimal tinggi layarnya
    // kiri layar itu adalah x = 0, kanan layar itu maksimal lebarnya
    // maksud dari bottom ini adalah (gameRef.size.y - 60) adalah tinggi layar dikurangi 60,
    // berarti jika tinggi layarnya 800 berarti 800 dikurangi dengan 60, kenapa ada 60 agar player kita tersebut tidak tembus ke bawah
    _bottomBound = gameRef.size.y - 60;
    // kenapa top bound tidak menggunakan gameRef.size.y - 60, karena atas itu y = 0, jadi langsung saja ditambah margin 60 jadi player tidak aakan tembus ke atas
    _topBound = 60;
    // ini itu sama saja kita dengan memberikan margin atau bisa dibilang pembatas di setiap sisinya
    _leftBound = 60;
    _rightBound = gameRef.size.x - 60;

    // ini digunakan untuk memberikan box di player
    // jika ingin melihat box nya kamu bisa menggunakan kode debugMode
    // debugMode = true;
    add(RectangleHitbox());
  }
}
