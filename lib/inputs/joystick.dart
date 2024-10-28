import 'package:flame/components.dart';
import 'package:flutter/material.dart';

JoystickComponent joystickComponent = JoystickComponent(
  knob: CircleComponent(
    radius: 30,
    paint: Paint()..color = Colors.grey,
  ),
  background: CircleComponent(
    radius: 70,
    paint: Paint()..color = Colors.grey.withAlpha(100),
  ),
  margin: const EdgeInsets.only(right: 40, bottom: 40),
);
