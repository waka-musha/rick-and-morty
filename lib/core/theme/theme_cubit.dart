import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_rick_and_morty/core/theme/theme_storage.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._storage) : super(_storage.load());
  final ThemeStorage _storage;

  Future<void> set(ThemeMode mode) async {
    await _storage.save(mode);
    emit(mode);
  }

  Future<void> cycle() {
    final next = switch (state) {
      ThemeMode.system => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
    };
    return set(next);
  }
}
