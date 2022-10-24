// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter/material.dart';

import '../common/app_const.dart';
import '../common/app_settings.dart';
import '../common/ui_strings.dart';
import '../widgets/neverending_list_view.dart';
import 'item_screen.dart';

class ScrollingScreen extends StatefulWidget {
  const ScrollingScreen({super.key});

  @override
  State<ScrollingScreen> createState() => _ScrollingScreenState();
}

class _ScrollingScreenState extends State<ScrollingScreen> {
  late ScrollController _scrollController;

  late final Timer _saveTimer;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController(
      initialScrollOffset: AppSettings().listScrollOffset,
    );

    _saveTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      AppSettings().listScrollOffset = _scrollController.offset;
    });
  }

  @override
  void dispose() {
    if (_saveTimer.isActive) _saveTimer.cancel();
    super.dispose();
  }

  Future<void> _onListItemTap(BuildContext context, int index, Color color) async {
    await Navigator.pushNamed(
      context,
      AppConst.itemRoute,
      arguments: ItemScreenArguments(index, color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(UIStrings.scrollingScreenTitle),
      ),
      body: NeverendingListView(
        scrollController: _scrollController,
        onItemTap: (int index, Color color) => _onListItemTap(context, index, color),
      ),
    );
  }
}
