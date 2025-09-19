import 'package:ta_rick_and_morty/features/characters_list/domain/entities/character.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/entities/characters_page.dart';

abstract class CharactersRepo {
  Future<CharactersPage> getPage({
    required int page,
    bool forceRefresh = false,
  });

  Future<List<Character>> getByIds(Set<int> ids);

  Future<void> toggleFavorite(int id);

  Future<bool> isFavorite(int id);

  Future<Set<int>> loadFavorites();

  Stream<Set<int>> watchFavorites();
}
