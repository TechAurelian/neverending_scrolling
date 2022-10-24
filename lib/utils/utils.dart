// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Utils {
  static final NumberFormat _numberFormat = NumberFormat.decimalPattern();

  static String intToCommaSeparatedString(int value) {
    return _numberFormat.format(value);
  }

  /// Stores the given text on the clipboard, and optionally shows a [SnackBar] on success.
  static Future<void> copyToClipboard(BuildContext context, String value,
      {String? successText}) async {
    ScaffoldMessengerState messengerState = ScaffoldMessenger.of(context);
    try {
      await Clipboard.setData(ClipboardData(text: value));
      if (successText != null) {
        messengerState.showSnackBar(SnackBar(content: Text(successText)));
      }
    } catch (error) {
      messengerState.showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }
}
