import 'package:buzzup/core/models/all_models.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth.repo.dart';

class UpdateUserUsecase extends UsecaseWithParams<void, User> {
  const UpdateUserUsecase(this._repo);

  final AuthRepo _repo;
  @override
  ResultFuture<void> call(User params) async => await _repo.updateUser(params);
}
