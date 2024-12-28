import 'package:buzzup/core/errors/exception.dart';
import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/data/datasources/theme_mode/theme_mode_local_datasrc.dart';
import 'package:buzzup/src/domain/repositories/theme_mode/theme_mode.repo.dart';

class ThemeModeRepoImpl implements ThemeModeRepo {
  const ThemeModeRepoImpl(this._themeModeLocalDatasrc);
  final ThemeModeLocalDatasrc _themeModeLocalDatasrc;
  @override
  ResultFuture<bool> getThemeMode() async {
    try {
      final themeMode = await _themeModeLocalDatasrc.getCachedThemeData();
      return Right(themeMode);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }

  @override
  ResultFuture<bool> getUseSystemTheme() async {
    try {
      final useSystemTheme = await _themeModeLocalDatasrc.getUseSystemTheme();
      return Right(useSystemTheme);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> setThemeMode({required bool mode}) async {
    try {
      await _themeModeLocalDatasrc.cacheThemeData(mode: mode);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> setUseSystemTheme({required bool useSystemTheme}) async {
    try {
      await _themeModeLocalDatasrc.cacheUseSystemTheme(
        useSystemTheme: useSystemTheme,
      );
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }
}
