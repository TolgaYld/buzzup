import 'package:buzzup/core/utils/typedefs.dart';

abstract class ThemeModeRepo {
  const ThemeModeRepo();

  ResultFuture<bool> getThemeMode();

  ResultFuture<void> setThemeMode({required bool mode});

  ResultFuture<bool> getUseSystemTheme();

  ResultFuture<void> setUseSystemTheme({required bool useSystemTheme});
}
