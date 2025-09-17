import 'package:flutter/material.dart';
import 'package:ta_rick_and_morty/app/app.dart';
import 'package:ta_rick_and_morty/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  runApp(const App());
}
