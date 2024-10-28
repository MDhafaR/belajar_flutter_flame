import 'package:belajar_flutter_flame/flutter_game/fit_fighter.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final FitFighter game = FitFighter();
  runApp(GameWidget(game: game));
}