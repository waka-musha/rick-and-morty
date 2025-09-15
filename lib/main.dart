import 'package:flutter/material.dart';
import 'package:ta_rick_and_morty/app/di.dart';
import 'package:ta_rick_and_morty/app/rick_and_morty_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  runApp(const RickAndMortyApp());
}
