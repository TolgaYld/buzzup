import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/theme_mode/theme_mode.repo.dart';

class SetUseSystemThemeUsecase extends UsecaseWithParams<void, bool> {
  const SetUseSystemThemeUsecase(this._repo);

  final ThemeModeRepo _repo;
  @override
  ResultFuture<void> call(bool params) => _repo.setUseSystemTheme(useSystemTheme: params);
}
