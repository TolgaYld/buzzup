import 'package:buzzup/core/common/constants.dart';
import 'package:buzzup/core/errors/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ThemeModeLocalDatasrc {
  Future<bool> getCachedThemeData();
  Future<bool> getUseSystemTheme();
  Future<void> cacheThemeData({required bool mode});
  Future<void> cacheUseSystemTheme({required bool useSystemTheme});
}

class ThemeModeLocalDatasrcImpl implements ThemeModeLocalDatasrc {
  ThemeModeLocalDatasrcImpl(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;
  @override
  Future<void> cacheThemeData({required bool mode}) async {
    try {
      await _sharedPreferences.setBool(kCachedThemeModeKey, mode);
    } catch (e) {
      throw CacheException(
        message: 'Bool not setted',
      );
    }
  }

  @override
  Future<bool> getCachedThemeData() async {
    try {
      final modeBool = _sharedPreferences.getBool(kCachedThemeModeKey);

      if (modeBool != null) {
        return await Future.value(modeBool);
      } else {
        throw CacheException(
          message: "Can't fetch theme mode",
        );
      }
    } on CacheException {
      rethrow;
    } catch (e) {
      throw CacheException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> getUseSystemTheme() async {
    try {
      final useSystemTheme = _sharedPreferences.getBool(
        kCachedUseSystemThemeKey,
      );

      if (useSystemTheme != null) {
        return await Future.value(useSystemTheme);
      } else {
        throw CacheException(
          message: "Can't get bool",
        );
      }
    } on CacheException {
      rethrow;
    } catch (e) {
      throw CacheException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> cacheUseSystemTheme({required bool useSystemTheme}) async {
    try {
      await _sharedPreferences.setBool(
        kCachedUseSystemThemeKey,
        useSystemTheme,
      );
    } catch (e) {
      throw CacheException(
        message: e.toString(),
      );
    }
  }
}
