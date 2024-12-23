import 'package:buzzup/core/models/user.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth_repo.dart';

class AuthWithProviderUsecase extends UsecaseWithParams<
    User,
    ({
      String provider,
      String email,
      String providerId,
      List<double> coordinates
    })> {
  const AuthWithProviderUsecase(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<User> call(
    ({
      String provider,
      String email,
      String providerId,
      List<double> coordinates
    }) params,
  ) async =>
      await _repo.authWithProvider(
        provider: params.provider,
        providerId: params.providerId,
        email: params.email,
        coordinates: params.coordinates,
      );

  static ({
    String provider,
    String email,
    String providerId,
    List<double> coordinates,
  }) get emptyParams => (
        provider: "google",
        email: 'empty',
        providerId: 'empty',
        coordinates: [3.69, 3.69],
      );
}
