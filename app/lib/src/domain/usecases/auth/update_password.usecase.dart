import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth.repo.dart';

typedef UpdatePasswordParams = ({String password, String repeatPassword});

class UpdatePasswordUsecase extends UsecaseWithParams<void, UpdatePasswordParams> {
  const UpdatePasswordUsecase(this._repo);

  final AuthRepo _repo;
  @override
  ResultFuture<void> call(UpdatePasswordParams params) async => await _repo.updatePassword(
        password: params.password,
        repeatPassword: params.repeatPassword,
      );

  static UpdatePasswordParams get emptyParams => (password: "", repeatPassword: "");
}
