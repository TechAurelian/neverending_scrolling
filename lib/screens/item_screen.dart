// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../common/ui_strings.dart';
import '../utils/color_utils.dart';
import '../utils/utils.dart';

class ItemScreenArguments {
  final int index;
  final Color color;

  ItemScreenArguments(this.index, this.color);
}

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.index, required this.color});

  final int index;
  final Color color;

  void _onCopyPressed(BuildContext context) {
    final String colorHex = ColorUtils.toHex(color);
    Utils.copyToClipboard(context, colorHex, successText: UIStrings.colorCopiedSnackbar(colorHex));
  }

  @override
  Widget build(BuildContext context) {
    final Color contrastColor = ColorUtils.contrastOf(color);

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text(UIStrings.itemScreenTitle(Utils.intToCommaSeparatedString(index))),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: UIStrings.copyActionTooltip,
            onPressed: () => _onCopyPressed(context),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            UIStrings.itemColorCaption,
            style: Theme.of(context).textTheme.caption!.copyWith(color: contrastColor),
            textAlign: TextAlign.center,
          ),
          Text(
            ColorUtils.toHex(color),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: contrastColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
