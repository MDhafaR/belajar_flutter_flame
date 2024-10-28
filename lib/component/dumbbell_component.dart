import 'dart:async';

import 'package:belajar_flutter_flame/component/player_skinny_component.dart';
import 'package:belajar_flutter_flame/constant/global.dart';
import 'package:belajar_flutter_flame/flutter_game/fit_fighter.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

class DumbbellComponent extends SpriteComponent
    with HasGameRef<FitFighter>, CollisionCallbacks {
  final double _sizeDumbbell = 50;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Globals.dumbbell);
    position = Vector2(200, 200);
    height = width = _sizeDumbbell;
    anchor = Anchor.center;

    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    // ketika dumble terkena player maka dumbbell akan hilang dengan mengeluarkan sound
    if (other is PlayerSkinnyComponent) {
      FlameAudio.play(Globals.dumbbellSound);
      removeFromParent();
    }
  }
}