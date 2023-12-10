import 'dart:math';
import 'package:flutter/material.dart';



final List<Color> specificColors = [
  const Color(0xff15d2bc),
  const Color(0xffe26ca5),
  const Color(0xff564ca3),
  const Color(0xffcd9d0f),
  // Add more colors as needed
];

Color getRandomColor() {
  // Generating random index to select a color from the specificColors list
  Random random = Random();
  return specificColors[random.nextInt(specificColors.length)];
}


