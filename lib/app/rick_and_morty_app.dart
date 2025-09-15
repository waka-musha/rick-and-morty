import 'package:flutter/material.dart';
import 'package:ta_rick_and_morty/features/characters_list/presentation/pages/characters_list_page.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rick And Morty App',
      home: CharactersListPage(),
    );
  }
}
