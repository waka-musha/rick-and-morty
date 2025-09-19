import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_rick_and_morty/app/di.dart';
import 'package:ta_rick_and_morty/app/home_nav.dart';
import 'package:ta_rick_and_morty/core/theme/theme_cubit.dart';
import 'package:ta_rick_and_morty/core/theme/theme_storage.dart';

class App extends StatelessWidget {
  const App({super.key});

  static const _seed = Color(0xFF39D98A);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(sl<ThemeStorage>()),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          final lightScheme = ColorScheme.fromSeed(
            seedColor: _seed,
          );
          final darkScheme = ColorScheme.fromSeed(
            seedColor: _seed,
            brightness: Brightness.dark,
          );

          return MaterialApp(
            title: 'Rick & Morty',
            debugShowCheckedModeBanner: false,
            themeMode: mode,

            theme: ThemeData(
              useMaterial3: true,
              colorScheme: lightScheme,
              appBarTheme: const AppBarTheme(
                centerTitle: false,
                foregroundColor: Colors.white,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                iconTheme: IconThemeData(color: Colors.white),
                actionsIconTheme: IconThemeData(color: Colors.white),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: lightScheme.primary,
                unselectedItemColor: lightScheme.onSurfaceVariant,
              ),
              cardTheme: CardThemeData(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              snackBarTheme: const SnackBarThemeData(
                behavior: SnackBarBehavior.floating,
              ),
            ),

            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: darkScheme,
              appBarTheme: const AppBarTheme(
                centerTitle: false,
                foregroundColor: Colors.white,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                iconTheme: IconThemeData(color: Colors.white),
                actionsIconTheme: IconThemeData(color: Colors.white),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: darkScheme.primary,
                unselectedItemColor: darkScheme.onSurfaceVariant,
              ),
              cardTheme: CardThemeData(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              snackBarTheme: const SnackBarThemeData(
                behavior: SnackBarBehavior.floating,
              ),
            ),

            home: const HomeNav(),
          );
        },
      ),
    );
  }
}
