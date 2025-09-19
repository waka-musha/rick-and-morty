// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharactersPageDto _$CharactersPageDtoFromJson(Map<String, dynamic> json) =>
    _CharactersPageDto(
      info: InfoDto.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersPageDtoToJson(_CharactersPageDto instance) =>
    <String, dynamic>{
      'info': instance.info.toJson(),
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

_InfoDto _$InfoDtoFromJson(Map<String, dynamic> json) => _InfoDto(
  count: (json['count'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
);

Map<String, dynamic> _$InfoDtoToJson(_InfoDto instance) => <String, dynamic>{
  'count': instance.count,
  'pages': instance.pages,
  'next': instance.next,
  'prev': instance.prev,
};
