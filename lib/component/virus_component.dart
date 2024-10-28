import 'dart:async';

import 'package:belajar_flutter_flame/component/player_skinny_component.dart';
import 'package:belajar_flutter_flame/constant/global.dart';
import 'package:belajar_flutter_flame/flutter_game/fit_fighter.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

class VirusComponent extends SpriteComponent
    with HasGameRef<FitFighter>, CollisionCallbacks {
  final double _sizeVirus = 50;
  final Vector2 startPosition;

  VirusComponent({required this.startPosition});

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Globals.virus);
    position = startPosition;
    height = width = _sizeVirus;
    anchor = Anchor.center;

    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    // ketika dumble terkena player maka Virus akan hilang dengan mengeluarkan sound
    if (other is PlayerSkinnyComponent) {
      FlameAudio.play(Globals.virusSound);
      removeFromParent();
    }
  }
}
