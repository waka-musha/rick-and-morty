import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/entities/character.dart';

part 'favorites_state.freezed.dart';

enum FavoritesStatus { initial, loading, success, empty, failure }

enum FavoritesSort { name, status }

@freezed
abstract class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(FavoritesStatus.initial) FavoritesStatus status,
    @Default(<Character>[]) List<Character> items,
    @Default(<int>{}) Set<int> favoriteIds,
    @Default(FavoritesSort.name) FavoritesSort sortBy,
    @Default(true) bool ascending,
    String? error,
    @Default(false) bool isRefreshing,
  }) = _FavoritesState;
}
