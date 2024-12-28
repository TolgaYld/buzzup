import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/theme_mode/theme_mode.repo.dart';

class GetUseSystemThemeUsecase extends UsecaseWithoutParams<bool> {
  const GetUseSystemThemeUsecase(this._repo);

  final ThemeModeRepo _repo;
  @override
  ResultFuture<bool> call() => _repo.getUseSystemTheme();
}
