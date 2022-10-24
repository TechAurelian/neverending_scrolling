// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'dart:ui';
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';
import '../utils/utils.dart';

class NeverendingListView extends StatelessWidget {
  const NeverendingListView({super.key, this.onItemTap});

  /// Called when the user taps a list item.
  final GestureTapCallback? onItemTap;

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
  final GestureTapCallback? onItemTap;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = ColorUtils.randomColorFromSeed(index);
    final Color foregroundColor = ColorUtils.contrastOf(backgroundColor);

    return InkWell(
      onTap: onItemTap,
      child: Ink(
        color: ColorUtils.randomColorFromSeed(index),
        child: Center(
          child: Text(
            Utils.intToCommaSeparatedString(index),
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w600,
              fontFeatures: const <FontFeature>[FontFeature.oldstyleFigures()],
              color: foregroundColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
