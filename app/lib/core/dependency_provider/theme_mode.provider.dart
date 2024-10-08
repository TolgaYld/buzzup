import 'package:buzzup/src/data/datasources/theme_mode/theme_mode_local_datasrc.dart';
import 'package:buzzup/src/data/repositories/theme_mode/theme_mode_repo_impl.dart';
import 'package:buzzup/src/domain/repositories/theme_mode/theme_mode_repo.dart';
import 'package:buzzup/src/domain/usecases/theme_mode/get_theme_mode_usecase.dart';
import 'package:buzzup/src/domain/usecases/theme_mode/get_use_system_theme_usecase.dart';
import 'package:buzzup/src/domain/usecases/theme_mode/set_theme_mode_usecase.dart';
import 'package:buzzup/src/domain/usecases/theme_mode/set_use_system_theme_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Provider SharedPreferences
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

// Provider ThemeModeLocalDatasrc
final themeModeLocalDataSourceProvider = Provider<ThemeModeLocalDatasrc>((ref) {
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  return ThemeModeLocalDatasrcImpl(sharedPreferences);
});

// Repository Provider
final themeModeRepoProvider = Provider<ThemeModeRepo>((ref) {
  final localDatasource = ref.read(themeModeLocalDataSourceProvider);
  return ThemeModeRepoImpl(localDatasource);
});

// Usecases Providers
final getThemeModeUsecaseProvider = Provider<GetThemeModeUsecase>((ref) {
  final repo = ref.read(themeModeRepoProvider);
  return GetThemeModeUsecase(repo);
});

final getUseSystemThemeUsecaseProvider =
    Provider<GetUseSystemThemeUsecase>((ref) {
  final repo = ref.read(themeModeRepoProvider);
  return GetUseSystemThemeUsecase(repo);
});

final setThemeModeUsecaseProvider = Provider<SetThemeModeUsecase>((ref) {
  final repo = ref.read(themeModeRepoProvider);
  return SetThemeModeUsecase(repo);
});

final setUseSystemThemeUsecaseProvider =
    Provider<SetUseSystemThemeUsecase>((ref) {
  final repo = ref.read(themeModeRepoProvider);
  return SetUseSystemThemeUsecase(repo);
});
