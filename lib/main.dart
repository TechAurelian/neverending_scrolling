// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'common/app_const.dart';
import 'common/app_settings.dart';
import 'common/ui_strings.dart';
import 'screens/item_screen.dart';
import 'screens/scrolling_screen.dart';

Future<void> main() async {
  // First try to load the app settings from Shared Preferences
  WidgetsFlutterBinding.ensureInitialized();
  await Future.any([
    AppSettings().load(),
    Future.delayed(const Duration(seconds: 5)),
  ]);

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
