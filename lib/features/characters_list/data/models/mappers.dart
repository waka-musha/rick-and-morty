import 'package:ta_rick_and_morty/features/characters_list/data/models/character_dto.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/models/characters_page_dto.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/entities/character.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/entities/characters_page.dart';

extension CharacterDtoX on CharacterDto {
  Character toEntity({required bool isFavorite}) {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      image: image,
      locationName: location.name,
      isFavorite: isFavorite,
    );
  }
}

extension CharactersPageDtoX on CharactersPageDto {
  CharactersPage toEntity({
    required int page,
    required Set<int> favorites,
  }) {
    final items = results
        .map((dto) => dto.toEntity(isFavorite: favorites.contains(dto.id)))
        .toList();

    return CharactersPage(
      page: page,
      totalPages: info.pages,
      results: items,
      hasNext: info.next != null,
    );
  }
}
