// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterDto _$CharacterDtoFromJson(Map<String, dynamic> json) =>
    _CharacterDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      image: json['image'] as String,
      location: LocationRefDto.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CharacterDtoToJson(_CharacterDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'image': instance.image,
      'location': instance.location,
    };

_LocationRefDto _$LocationRefDtoFromJson(Map<String, dynamic> json) =>
    _LocationRefDto(name: json['name'] as String, url: json['url'] as String?);

Map<String, dynamic> _$LocationRefDtoToJson(_LocationRefDto instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
