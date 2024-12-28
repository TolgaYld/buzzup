import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth.repo.dart';

class UpdatePasswordUsecase extends UsecaseWithParams<void, ({String password, String repeatPassword})> {
  const UpdatePasswordUsecase(this._repo);

  final AuthRepo _repo;
  @override
  ResultFuture<void> call(
    ({String password, String repeatPassword}) params,
  ) async =>
      await _repo.updatePassword(
        password: params.password,
        repeatPassword: params.repeatPassword,
      );

  static ({String password, String repeatPassword}) get emptyParams => (password: "", repeatPassword: "");
}
