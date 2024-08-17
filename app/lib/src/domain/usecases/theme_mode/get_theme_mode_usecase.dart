import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/theme_mode/theme_mode_repo.dart';

class GetThemeModeUsecase extends UsecaseWithoutParams<bool> {
  const GetThemeModeUsecase(this._repo);

  final ThemeModeRepo _repo;
  @override
  ResultFuture<bool> call() => _repo.getThemeMode();
}
