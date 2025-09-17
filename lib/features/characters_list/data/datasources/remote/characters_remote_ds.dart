import 'package:ta_rick_and_morty/core/network/api_client.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/models/characters_page_dto.dart';

class CharactersRemoteDataSource {
  CharactersRemoteDataSource(this._api);
  final ApiClient _api;

  Future<CharactersPageDto> fetchPage({required int page}) async {
    final res = await _api.get<Map<String, dynamic>>(
      'character',
      query: {'page': page},
    );

    final data = res.data;
    if (data == null) {
      throw Exception('Empty response');
    }
    return CharactersPageDto.fromJson(data);
  }
}
