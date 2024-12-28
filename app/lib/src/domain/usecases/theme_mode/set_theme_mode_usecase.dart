import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/theme_mode/theme_mode.repo.dart';

class SetThemeModeUsecase extends UsecaseWithParams<void, bool> {
  const SetThemeModeUsecase(this._repo);

  final ThemeModeRepo _repo;
  @override
  ResultFuture<void> call(bool params) => _repo.setThemeMode(mode: params);
}
