class Boxes {
  Boxes._();

  static const characters = 'characters';
  static const favorites = 'favorites';
  static const settings = 'settings';
}

class CacheKeys {
  CacheKeys._();

  static String charactersPage(int page) => 'page:$page';
  static String characterById(int id) => 'char:$id';
}

class SettingsKeys {
  SettingsKeys._();

  static const themeMode = 'themeMode';
}
