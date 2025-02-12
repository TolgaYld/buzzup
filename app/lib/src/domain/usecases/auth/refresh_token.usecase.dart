import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth.repo.dart';

class RefreshTokenUsecase extends UsecaseWithoutParams<TokenEntity> {
  const RefreshTokenUsecase(this._repo);
  final AuthRepo _repo;
  @override
  ResultFuture<TokenEntity> call() async => await _repo.refreshToken();
}
