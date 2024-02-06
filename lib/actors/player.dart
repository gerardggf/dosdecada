import 'dart:async';

import 'package:dosdecada/dosdecada.dart';
import 'package:flame/components.dart';

enum PlayerState {
  idle,
  running,
}

class Player extends SpriteAnimationGroupComponent with HasGameRef<Dosdecada> {
  Player({required this.character});

  String character;

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    idleAnimation = _spriteAnimation('Idle', 11);

    runningAnimation = _spriteAnimation('Run', 12);

    //list of all animations
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runningAnimation
    };

    //set current animations
    current = PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation(String state, int amount) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Main Characters/$character/$state (32x32).png'),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}
