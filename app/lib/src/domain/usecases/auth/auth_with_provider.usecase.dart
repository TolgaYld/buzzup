import 'package:buzzup/core/models/user.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth.repo.dart';

typedef AuthWithProviderParams = ({
  String provider,
  String email,
  String providerId,
  List<double> coordinates,
});

class AuthWithProviderUsecase extends UsecaseWithParams<User, AuthWithProviderParams> {
  const AuthWithProviderUsecase(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<User> call(AuthWithProviderParams params) async => await _repo.authWithProvider(
        provider: params.provider,
        providerId: params.providerId,
        email: params.email,
        coordinates: params.coordinates,
      );

  static AuthWithProviderParams get emptyParams => (
        provider: "google",
        email: 'empty',
        providerId: 'empty',
        coordinates: [3.69, 3.69],
      );
}
