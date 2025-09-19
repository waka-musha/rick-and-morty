import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/datasources/local/characters_cache_ds.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/datasources/local/favorites_local_ds.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/datasources/remote/characters_remote_ds.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/models/character_dto.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/models/characters_page_dto.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/models/mappers.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/entities/character.dart';
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
      } on DioException catch (e) {
        debugPrint(
          '[DIO] ${e.type} ${e.response?.statusCode} ${e.requestOptions.uri}',
        );
        dto = _tryLoadFromCache(page);
        if (dto == null) {
          throw Exception('Network error and no cache for page $page.');
        }
      } on Object catch (e) {
        debugPrint('[UNEXPECTED] $e');
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
  Future<List<Character>> getByIds(Set<int> ids) async {
    if (ids.isEmpty) return const [];

    final cachedJsonById = _cache.findCharactersJsonInCache(ids);
    final fromCacheDtos = <CharacterDto>[];
    for (final entry in cachedJsonById.entries) {
      final id = entry.key;
      final json = entry.value;
      final dto = _tryParseCharacterDto(json, idForCleanup: id);
      if (dto != null) fromCacheDtos.add(dto);
    }

    final missing = ids.difference(fromCacheDtos.map((e) => e.id).toSet());
    final fromNetDtos = <CharacterDto>[];

    if (missing.isNotEmpty) {
      for (final chunk in _chunkIds(missing, 20)) {
        try {
          final dtos = await _remote.fetchManyByIds(chunk);
          fromNetDtos.addAll(dtos);
          await Future.wait(
            dtos.map(
              (d) => _cache.saveCharacterJson(id: d.id, json: d.toJson()),
            ),
          );
        } on DioException catch (e) {
          debugPrint(
            '[DIO:getByIds] ${e.type} '
            '${e.response?.statusCode} '
            '${e.requestOptions.uri} '
            '(ids=${chunk.join(",")})',
          );
        } on Object catch (e) {
          debugPrint('[UNEXPECTED:getByIds] $e (ids=${chunk.join(",")})');
        }
      }
    }

    final byId = <int, CharacterDto>{};
    for (final d in fromCacheDtos) {
      byId[d.id] = d;
    }
    for (final d in fromNetDtos) {
      byId[d.id] = d;
    }

    final favs = _favorites.loadAll();
    return byId.values
        .map((dto) => dto.toEntity(isFavorite: favs.contains(dto.id)))
        .toList(growable: false);
  }

  CharacterDto? _tryParseCharacterDto(
    Map<String, dynamic> json, {
    int? idForCleanup,
  }) {
    try {
      return CharacterDto.fromJson(json);
    } on Object catch (e) {
      if (idForCleanup != null) {
        unawaited(_cache.removeCharacter(idForCleanup));
      }
      debugPrint(
        '[WARN:getByIds] invalid cached snapshot for id=$idForCleanup: $e',
      );
      return null;
    }
  }

  List<List<int>> _chunkIds(Set<int> ids, int size) {
    if (ids.isEmpty) return const [];
    final list = ids.toList(growable: false);
    final chunks = <List<int>>[];
    for (var i = 0; i < list.length; i += size) {
      final end = (i + size < list.length) ? i + size : list.length;
      chunks.add(list.sublist(i, end));
    }
    return chunks;
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
