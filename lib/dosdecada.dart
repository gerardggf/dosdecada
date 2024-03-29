import 'dart:async';
import 'dart:ui';

import 'package:dosdecada/levels/level.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class Dosdecada extends FlameGame {
  late final CameraComponent cam;

  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);

  @override
  final world = Level();

  @override
  FutureOr<void> onLoad() async {
    //load all images into cache
    await images.loadAllImages();

    cam = CameraComponent.withFixedResolution(
      width: 640,
      height: 360,
      world: world,
    );
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll(
      [cam, world],
    );
    return super.onLoad();
  }
}
