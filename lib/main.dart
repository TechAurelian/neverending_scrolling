// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'common/ui_strings.dart';
import 'screens/scrolling_screen.dart';

void main() {
  runApp(const NeverendingScrollingApp());
}

class NeverendingScrollingApp extends StatelessWidget {
  const NeverendingScrollingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UIStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          onPrimary: Colors.black,
        ),
      ),
      home: const ScrollingScreen(),
    );
  }
}
