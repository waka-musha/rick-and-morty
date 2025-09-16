import 'package:dio/dio.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/datasources/local/characters_cache_ds.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/datasources/local/favorites_local_ds.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/datasources/remote/characters_remote_ds.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/models/characters_page_dto.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/models/mappers.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/entities/characters_page.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/repositories/characters_repo.dart';

class CharactersRepoImpl implements CharactersRepo {
  CharactersRepoImpl({
    required CharactersRemoteDataSource remote,
    required CharactersCacheLocalDataSource cache,
    required FavoritesLocalDataSource favorites,
  }) : _remote = remote,
       _cache = cache,
       _favorites = favorites;

  final CharactersRemoteDataSource _remote;
  final CharactersCacheLocalDataSource _cache;
  final FavoritesLocalDataSource _favorites;

  @override
  Future<CharactersPage> getPage({
    required int page,
    bool forceRefresh = false,
  }) async {
    CharactersPageDto? dto;

    if (!forceRefresh) {
      final cached = _cache.getPageJson(page: page);
      if (cached != null) {
        dto = CharactersPageDto.fromJson(cached);
      }
    }

    if (dto == null) {
      try {
        dto = await _remote.fetchPage(page: page);
        await _cache.savePageJson(page: page, json: dto.toJson());
      } on DioException {
        dto = _tryLoadFromCache(page);
        if (dto == null) {
          throw Exception('Network error and no cache for page $page.');
        }
      } on Object {
        dto = _tryLoadFromCache(page);
        if (dto == null) {
          throw Exception('Unexpected error and no cache for page $page.');
        }
      }
    }

    final favs = _favorites.loadAll();
    return dto.toEntity(page: page, favorites: favs);
  }

  CharactersPageDto? _tryLoadFromCache(int page) {
    final cached = _cache.getPageJson(page: page);
    return cached != null ? CharactersPageDto.fromJson(cached) : null;
  }

  @override
  Future<void> toggleFavorite(int id) async {
    final isFav = _favorites.isFavorite(id);
    await _favorites.setFavorite(id, isFav: !isFav);
  }

  @override
  Future<bool> isFavorite(int id) async => _favorites.isFavorite(id);

  @override
  Future<Set<int>> loadFavorites() async => _favorites.loadAll();

  @override
  Stream<Set<int>> watchFavorites() => _favorites.watchAll();
}
