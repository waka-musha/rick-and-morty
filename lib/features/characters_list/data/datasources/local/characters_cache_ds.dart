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
}
