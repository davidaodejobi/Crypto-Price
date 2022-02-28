import 'dart:math';

import 'package:flutter/material.dart';

const kScafoldBackgroundColor = Color(0xFFF9F9FA);

final List<Color> kRandomColors = [Colors.red, Colors.green];

Color randomGenerator() {
  return kRandomColors[Random().nextInt(1)];
}
