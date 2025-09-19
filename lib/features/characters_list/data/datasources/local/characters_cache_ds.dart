import 'package:hive_flutter/hive_flutter.dart';
import 'package:ta_rick_and_morty/core/db/boxes.dart';

class CharactersCacheLocalDataSource {
  CharactersCacheLocalDataSource(this._box);

  final Box<Map<String, dynamic>> _box;

  Future<void> savePageJson({
    required int page,
    required Map<String, dynamic> json,
  }) async {
    await _box.put(CacheKeys.charactersPage(page), json);
  }

  Map<String, dynamic>? getPageJson({required int page}) {
    return _box.get(CacheKeys.charactersPage(page));
  }

  Future<void> clear() => _box.clear();

  Future<void> saveCharacterJson({
    required int id,
    required Map<String, dynamic> json,
  }) async {
    await _box.put(CacheKeys.characterById(id), json);
  }

  Map<String, dynamic>? getCharacterJson({required int id}) {
    return _box.get(CacheKeys.characterById(id));
  }

  Map<String, dynamic>? _asStringKeyMap(Object? value) {
    if (value == null) return null;
    if (value is Map<String, dynamic>) return value;
    if (value is Map) return Map<String, dynamic>.from(value);
    return null;
  }

  Map<int, Map<String, dynamic>> findCharactersJsonInCache(Set<int> ids) {
    final foundById = <int, Map<String, dynamic>>{};
    if (ids.isEmpty) return foundById;

    final missing = ids.toSet();

    for (final id in ids) {
      final json = getCharacterJson(id: id);
      if (json != null) {
        foundById[id] = json;
        missing.remove(id);
      }
    }
    if (missing.isEmpty) return foundById;

    for (final key in _box.keys.whereType<String>()) {
      if (!key.startsWith('page:')) continue;

      final pageJson = _asStringKeyMap(_box.get(key));
      if (pageJson == null) continue;

      final results = pageJson['results'];
      if (results is! List) continue;

      for (final item in results) {
        if (missing.isEmpty) break;

        final map = _asStringKeyMap(item);
        if (map == null) continue;

        final id = map['id'];

        if (id is int && missing.remove(id)) {
          foundById[id] = map;
        }
      }

      if (missing.isEmpty) break;
    }

    return foundById;
  }

  Future<void> removeCharacter(int id) =>
      _box.delete(CacheKeys.characterById(id));
}
