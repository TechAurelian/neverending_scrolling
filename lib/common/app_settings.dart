// Copyright 2022 Tecdrop. All rights reserved.
// Use of this source code is governed by a user license that can be
// found in the LICENSE file.

import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  // -----------------------------------------------------------------------------------------------
  // Singleton
  // -----------------------------------------------------------------------------------------------

  factory AppSettings() {
    return _singleton;
  }

  AppSettings._internal();

  static final AppSettings _singleton = AppSettings._internal();

  // -----------------------------------------------------------------------------------------------
  // listScrollOffset setting
  // -----------------------------------------------------------------------------------------------

  static const String _listScrollOffsetKey = 'listScrollOffset';

  double _listScrollOffset = 0.0;

  double get listScrollOffset => _listScrollOffset;

  set listScrollOffset(double value) {
    if (_listScrollOffset != value) {
      _listScrollOffset = value;
      _saveListScrollOffset();
      print('$_listScrollOffset');
    }
  }

  /// Saves the counter tap mode to persistent storage.
  Future<void> _saveListScrollOffset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_listScrollOffsetKey, _listScrollOffset);
  }

  // -----------------------------------------------------------------------------------------------
  // Common
  // -----------------------------------------------------------------------------------------------

  /// Loads app settings from persistent storage.
  Future<void> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    listScrollOffset = prefs.getDouble(_listScrollOffsetKey) ?? 0.0;
  }
}
