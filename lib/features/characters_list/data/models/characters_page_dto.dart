import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/models/character_dto.dart';

part 'characters_page_dto.freezed.dart';
part 'characters_page_dto.g.dart';

@freezed
abstract class CharactersPageDto with _$CharactersPageDto {
  const factory CharactersPageDto({
    required InfoDto info,
    required List<CharacterDto> results,
  }) = _CharactersPageDto;

  factory CharactersPageDto.fromJson(Map<String, dynamic> json) =>
      _$CharactersPageDtoFromJson(json);
}

@freezed
abstract class InfoDto with _$InfoDto {
  const factory InfoDto({
    required int count,
    required int pages,
    String? next,
    String? prev,
  }) = _InfoDto;

  factory InfoDto.fromJson(Map<String, dynamic> json) =>
      _$InfoDtoFromJson(json);
}
