import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ta_rick_and_morty/core/db/boxes.dart';

class ThemeStorage {
  ThemeStorage(this._box);

  final Box<String> _box;

  static const String _key = SettingsKeys.themeMode;

  ThemeMode load() {
    final raw = _box.get(_key);
    switch (raw) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  Future<void> save(ThemeMode mode) {
    final s = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    return _box.put(_key, s);
  }
}
