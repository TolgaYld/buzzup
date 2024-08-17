import 'package:buzzup/core/models/user.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth_repo.dart';

class SignInUsecase extends UsecaseWithParams<
    User,
    ({
      String emailOrUsername,
      String password,
    })> {
  const SignInUsecase(this._repo);

  final AuthRepo _repo;
  @override
  ResultFuture<User> call(
    ({String emailOrUsername, String password}) params,
  ) async =>
      await _repo.signIn(
        emailOrUsername: params.emailOrUsername,
        password: params.password,
      );

  static ({String emailOrUsername, String password}) get emptyParams =>
      (emailOrUsername: "empty", password: "empty");
}
