// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../common/ui_strings.dart';
import '../utils/color_utils.dart';
import '../utils/utils.dart';

class ItemScreenArguments {
  final String indexStr;
  final Color color;

  ItemScreenArguments(this.indexStr, this.color);
}

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.indexStr, required this.color});

  final String indexStr;
  final Color color;

  void _onAppBarAction(BuildContext context, _AppBarActions action) {
    switch (action) {
      case _AppBarActions.copyIndex:
        Utils.copyToClipboard(context, indexStr, successText: UIStrings.itemCopied(indexStr));
        break;
      case _AppBarActions.copyColor:
        final String colorHex = ColorUtils.toHex(color);
        Utils.copyToClipboard(context, colorHex, successText: UIStrings.itemCopied(colorHex));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color contrastColor = ColorUtils.contrastOf(color);

    return Scaffold(
      backgroundColor: color,
      appBar: _AppBar(
        indexStr: indexStr,
        onAction: (_AppBarActions action) => _onAppBarAction(context, action),
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
          const SizedBox(height: 2.0),
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

enum _AppBarActions {
  copyIndex,
  copyColor,
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({Key? key, required this.onAction, required this.indexStr}) : super(key: key);

  final String indexStr;

  /// The callback that is called when an app bar action is pressed.
  final Function(_AppBarActions action) onAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(UIStrings.itemScreenTitle(indexStr)),
      actions: <Widget>[
        PopupMenuButton<_AppBarActions>(
          onSelected: onAction,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<_AppBarActions>>[
            const PopupMenuItem<_AppBarActions>(
              value: _AppBarActions.copyIndex,
              child: Text(UIStrings.copyItemAction),
            ),
            const PopupMenuItem<_AppBarActions>(
              value: _AppBarActions.copyColor,
              child: Text(UIStrings.copyColorAction),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
