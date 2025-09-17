import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/entities/character.dart';

part 'characters_state.freezed.dart';

enum CharactersStatus { initial, loading, success, failure }

@freezed
abstract class CharactersState with _$CharactersState {
  const factory CharactersState({
    @Default(CharactersStatus.initial) CharactersStatus status,

    @Default(<Character>[]) List<Character> items,

    @Default(1) int page,

    @Default(1) int totalPages,

    @Default(false) bool hasNext,

    String? error,

    @Default(false) bool isLoadingMore,

    @Default(false) bool isRefreshing,
  }) = _CharactersState;
}
