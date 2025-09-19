import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_rick_and_morty/core/theme/theme_cubit.dart';

class ThemeModeAction extends StatelessWidget {
  const ThemeModeAction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) {
        IconData icon;
        switch (mode) {
          case ThemeMode.light:
            icon = Icons.light_mode;
          case ThemeMode.dark:
            icon = Icons.dark_mode;
          case ThemeMode.system:
            icon = Icons.brightness_auto;
        }

        return PopupMenuButton<ThemeMode>(
          icon: Icon(icon),
          tooltip: 'Тема',
          onSelected: (m) => context.read<ThemeCubit>().set(m),
          itemBuilder: (_) => const [
            PopupMenuItem(value: ThemeMode.system, child: Text('Системная')),
            PopupMenuItem(value: ThemeMode.light, child: Text('Светлая')),
            PopupMenuItem(value: ThemeMode.dark, child: Text('Тёмная')),
          ],
        );
      },
    );
  }
}
