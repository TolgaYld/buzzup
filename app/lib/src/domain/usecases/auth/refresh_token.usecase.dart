import 'package:buzzup/core/models/token.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth_repo.dart';

class RefreshTokenUsecase extends UsecaseWithoutParams<Token> {
  const RefreshTokenUsecase(this._repo);
  final AuthRepo _repo;
  @override
  ResultFuture<Token> call() async => await _repo.refreshToken();
}
