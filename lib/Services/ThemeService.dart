import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _storage = GetStorage();
  final _key = 'isThemeMode';

  ThemeMode get theme => _loadThemeFromGetStorage() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromGetStorage() => _storage.read(_key) ?? false;
  _saveThemeToGetStorage(bool isDarkMode) => _storage.write(_key, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromGetStorage() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToGetStorage(!_loadThemeFromGetStorage());
  }
}
