import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ta_rick_and_morty/core/db/boxes.dart';
import 'package:ta_rick_and_morty/core/network/api_client.dart';
import 'package:ta_rick_and_morty/core/theme/theme_storage.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/datasources/local/characters_cache_ds.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/datasources/local/favorites_local_ds.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/datasources/remote/characters_remote_ds.dart';
import 'package:ta_rick_and_morty/features/characters_list/data/repositories/characters_repo_impl.dart';
import 'package:ta_rick_and_morty/features/characters_list/domain/repositories/characters_repo.dart';

final GetIt sl = GetIt.instance;

Future<void> initDI() async {
  await Hive.initFlutter();

  final charactersBox = await Hive.openBox<Map<String, dynamic>>(
    Boxes.characters,
  );
  await charactersBox.clear();
  final favoritesBox = await Hive.openBox<bool>(Boxes.favorites);
  final settingsBox = await Hive.openBox<String>(Boxes.settings);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  sl
    ..registerLazySingleton<Box<Map<String, dynamic>>>(
      () => charactersBox,
      instanceName: Boxes.characters,
    )
    ..registerLazySingleton<Box<bool>>(
      () => favoritesBox,
      instanceName: Boxes.favorites,
    )
    ..registerLazySingleton<Box<String>>(
      () => settingsBox,
      instanceName: Boxes.settings,
    )
    ..registerLazySingleton<Dio>(() => dio)
    ..registerLazySingleton<ApiClient>(() => ApiClient(sl<Dio>()))
    ..registerLazySingleton<CharactersRemoteDataSource>(
      () => CharactersRemoteDataSource(sl<ApiClient>()),
    )
    ..registerLazySingleton<CharactersCacheLocalDataSource>(
      () => CharactersCacheLocalDataSource(
        sl<Box<Map<String, dynamic>>>(instanceName: Boxes.characters),
      ),
    )
    ..registerLazySingleton<FavoritesLocalDataSource>(
      () => FavoritesLocalDataSource(
        sl<Box<bool>>(instanceName: Boxes.favorites),
      ),
    )
    ..registerLazySingleton<CharactersRepo>(
      () => CharactersRepoImpl(
        remote: sl<CharactersRemoteDataSource>(),
        cache: sl<CharactersCacheLocalDataSource>(),
        favorites: sl<FavoritesLocalDataSource>(),
      ),
    )
    ..registerLazySingleton<ThemeStorage>(
      () => ThemeStorage(
        sl<Box<String>>(instanceName: Boxes.settings),
      ),
    );
}
