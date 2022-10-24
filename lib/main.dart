// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:neverending_scrolling/screens/item_screen.dart';

import 'common/app_const.dart';
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
      initialRoute: AppConst.homeRoute,
      routes: <String, Widget Function(BuildContext)>{
        AppConst.homeRoute: (BuildContext context) => const ScrollingScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppConst.itemRoute:
            final ItemScreenArguments args = settings.arguments as ItemScreenArguments;
            return MaterialPageRoute(
              builder: (_) => ItemScreen(
                index: args.index,
                color: args.color,
              ),
            );
        }
        return null; // Let onUnknownRoute handle this behavior.
      },
    );
  }
}
