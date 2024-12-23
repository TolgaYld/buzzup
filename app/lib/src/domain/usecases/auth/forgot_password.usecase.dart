import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth_repo.dart';

class ForgotPasswordUsecase extends UsecaseWithParams<void, String> {
  const ForgotPasswordUsecase(this._repo);
  final AuthRepo _repo;
  @override
  ResultFuture<void> call(String params) async =>
      await _repo.forgotPassword(params);
}
