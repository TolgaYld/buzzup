import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth.repo.dart';

class SignOutUsecase extends UsecaseWithoutParams<void> {
  const SignOutUsecase(this._repo);
  final AuthRepo _repo;

  @override
  ResultFuture<void> call() async => await _repo.signOut();
}
