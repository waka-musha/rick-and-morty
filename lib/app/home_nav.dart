import 'package:flutter/material.dart';
import 'package:ta_rick_and_morty/features/characters_list/presentation/pages/characters_page.dart';
import 'package:ta_rick_and_morty/features/favorite_characters_list/presentation/pages/favorites_page.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  final _bucket = PageStorageBucket();
  int _index = 0;

  late final List<Widget> _pages = [
    const CharactersPage(),
    const FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: _bucket,
      child: Scaffold(
        body: IndexedStack(
          index: _index,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Персонажи',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Избранное'),
          ],
        ),
      ),
    );
  }
}
