import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth_repo.dart';

class CheckUsernameExistsUsecase extends UsecaseWithParams<bool, String> {
  const CheckUsernameExistsUsecase(this._repo);

  final AuthRepo _repo;
  @override
  ResultFuture<bool> call(String params) async =>
      await _repo.checkIfUsernameExists(params);
}
