import 'package:dosdecada/dosdecada.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  Dosdecada game = Dosdecada();
  runApp(
    GameWidget(
      game: kDebugMode ? Dosdecada() : game,
    ),
  );
}
