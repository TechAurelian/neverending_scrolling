// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../utils/color_utils.dart';
import '../utils/utils.dart';

class NeverendingListView extends StatelessWidget {
  const NeverendingListView({super.key, this.onItemTap});

  /// Called when the user taps a list item.
  final Function(int index, Color color)? onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 96.0,
      itemBuilder: (BuildContext context, int index) {
        return _ListViewItem(
          index: index,
          onItemTap: onItemTap,
        );
      },
    );
  }
}

class _ListViewItem extends StatelessWidget {
  // ignore: unused_element
  const _ListViewItem({super.key, required this.index, this.onItemTap});

  final int index;

  /// Called when the user taps the list item.
  final Function(int index, Color color)? onItemTap;

  @override
  Widget build(BuildContext context) {
    final Color color = ColorUtils.randomColorFromSeed(index);
    final Color contrastColor = ColorUtils.contrastOf(color);

    return InkWell(
      onTap: () => onItemTap?.call(index, color),
      child: Ink(
        color: ColorUtils.randomColorFromSeed(index),
        child: Center(
          child: Text(
            Utils.intToCommaSeparatedString(index),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: contrastColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
