import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/entities/character.dart';

part 'characters_page.freezed.dart';

@freezed
abstract class CharactersPage with _$CharactersPage {
  const factory CharactersPage({
    required int page,
    required int totalPages,
    required List<Character> results,
    required bool hasNext,
  }) = _CharactersPage;
}
