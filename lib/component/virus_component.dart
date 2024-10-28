import 'dart:async';
import 'dart:math';

import 'package:belajar_flutter_flame/constant/global.dart';
import 'package:belajar_flutter_flame/flutter_game/fit_fighter.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class VirusComponent extends SpriteComponent
    with HasGameRef<FitFighter>, CollisionCallbacks {
  final double _sizeVirus = 50;
  final Vector2 startPosition;

  VirusComponent({required this.startPosition});

  late Vector2 _kecepatan;
  final double _speed = 300;
  Vector2 _moveVirus() {
    // Menghasilkan sudut acak antara 0 sampai 2π (360 derajat)
    final randomAngle = Random().nextDouble() * 2 * pi;

    // Menghitung komponen y dari arah gerak menggunakan sin
    final sinAngle = sin(randomAngle);
    // Menghitung komponen x dari arah gerak menggunakan cos
    final cosAngle = cos(randomAngle);

    // Menghitung kecepatan pada sumbu x
    final double vx = cosAngle * _speed;
    // Menghitung kecepatan pada sumbu y
    final double vy = sinAngle * _speed;

    return Vector2(vx, vy);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Globals.virus);
    position = startPosition;
    height = width = _sizeVirus;
    anchor = Anchor.center;
    _kecepatan = _moveVirus();

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += _kecepatan * dt;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    // pengecekan ketika virus terkena layar
    if (other is ScreenHitbox) {
      final Vector2 collisionPoint = intersectionPoints.first;

      // Menggunakan if-else if untuk memastikan hanya satu kondisi yang dijalankan
      if (collisionPoint.x <= 0) {
        // Memantul dari dinding kiri
        _kecepatan.x = _speed.abs();
      } else if (collisionPoint.x >= gameRef.size.x - _sizeVirus) {
        // Memantul dari dinding kanan
        _kecepatan.x = -_speed.abs();
      } else if (collisionPoint.y <= 0) {
        // Memantul dari dinding atas
        _kecepatan.y = _speed.abs();
      } else if (collisionPoint.y >= gameRef.size.y - _sizeVirus) {
        // Memantul dari dinding bawah
        _kecepatan.y = -_speed.abs();
      }

      // Normalisasi kecepatan untuk mempertahankan kecepatan konstan
      _kecepatan = _kecepatan.normalized() * _speed;
    }
  }
}
