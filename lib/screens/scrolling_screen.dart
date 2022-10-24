// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../common/app_const.dart';
import '../common/ui_strings.dart';
import '../widgets/neverending_list_view.dart';
import 'item_screen.dart';

class ScrollingScreen extends StatelessWidget {
  const ScrollingScreen({super.key});

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
        onItemTap: (int index, Color color) => _onListItemTap(context, index, color),
      ),
    );
  }
}
