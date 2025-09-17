import 'package:hive_flutter/hive_flutter.dart';

class FavoritesLocalDataSource {
  FavoritesLocalDataSource(this._box);
  final Box<bool> _box;

  Future<void> setFavorite(
      int id, {
        required bool isFav,
      }) async {
    if (isFav) {
      await _box.put(id, true);
    } else {
      await _box.delete(id);
    }
  }

  bool isFavorite(int id) => _box.get(id) ?? false;

  Set<int> loadAll() {
    return _box.keys.whereType<int>().where((k) => _box.get(k) ?? false).toSet();
  }

  Stream<Set<int>> watchAll() async* {
    yield loadAll();
    await for (final _ in _box.watch()) {
      yield loadAll();
    }
  }
}
