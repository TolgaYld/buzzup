import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth.repo.dart';

typedef SignInParams = ({
  String emailOrUsername,
  String password,
  List<double> coordinates,
});

class SignInUsecase extends UsecaseWithParams<UserEntity, SignInParams> {
  const SignInUsecase(this._repo);

  final AuthRepo _repo;
  @override
  ResultFuture<UserEntity> call(SignInParams params) async => await _repo.signIn(
        emailOrUsername: params.emailOrUsername,
        password: params.password,
        coordinates: params.coordinates,
      );

  static SignInParams get emptyParams => (
        emailOrUsername: "empty",
        password: "empty",
        coordinates: [3.69, 3.69],
      );
}
