import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/auth/auth.repo.dart';

class UpdateUserUsecase extends UsecaseWithParams<void, UserEntity> {
  const UpdateUserUsecase(this._repo);

  final AuthRepo _repo;
  @override
  ResultFuture<void> call(UserEntity params) async => await _repo.updateUser(params);
}
