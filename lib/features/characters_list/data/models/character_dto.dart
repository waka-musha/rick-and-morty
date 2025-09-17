import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
abstract class CharacterDto with _$CharacterDto {
  const factory CharacterDto({
    required int id,
    required String name,
    required String status,
    required String species,
    required String image,
    required LocationRefDto location,
  }) = _CharacterDto;

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);
}

@freezed
abstract class LocationRefDto with _$LocationRefDto {
  const factory LocationRefDto({
    required String name,
    String? url,
  }) = _LocationRefDto;

  factory LocationRefDto.fromJson(Map<String, dynamic> json) =>
      _$LocationRefDtoFromJson(json);
}
