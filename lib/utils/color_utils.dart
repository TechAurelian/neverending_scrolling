// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'dart:math';
import 'package:flutter/material.dart';

class ColorUtils {
  ColorUtils._();

  static Color randomColorFromSeed(int seed) {
    final Random random = Random(seed);
    return Color(random.nextInt(0xFFFFFF)).withAlpha(255);
  }

  /// Returns the black or white contrast color of a given color.
  static Color contrastOf(Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.light ? Colors.black : Colors.white;

  /// Converts a Color value into a hexadecimal color string.
  static String toHex(Color color) =>
      '#${(color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}
