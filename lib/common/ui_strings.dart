// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

/// User interface static string constants.
class UIStrings {
  UIStrings._();

  // -----------------------------------------------------------------------------------------------
  // App
  // -----------------------------------------------------------------------------------------------

  static const String appName = 'Neverending Scrolling?';

  // -----------------------------------------------------------------------------------------------
  // Scrolling Screen
  // -----------------------------------------------------------------------------------------------

  static const String scrollingScreenTitle = 'Neverending Scrolling?';
  static const String listItem = 'Item';

  // -----------------------------------------------------------------------------------------------
  // Item Screen
  // -----------------------------------------------------------------------------------------------

  static String itemScreenTitle(String index) => 'Item $index';
  static const String itemColorCaption = 'Color';
  static const String copyItemAction = 'Copy item index';
  static const String copyColorAction = 'Copy color code';
  static String itemCopied(String value) => '$value copied to clipboard';
}
