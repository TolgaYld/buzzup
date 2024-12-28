import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/post/post.repo.dart';

class DeletePostUsecase extends UsecaseWithParams<void, String> {
  const DeletePostUsecase(this._repo);
  final PostRepo _repo;
  @override
  ResultFuture<void> call(String params) async => await _repo.delete(params);
}
