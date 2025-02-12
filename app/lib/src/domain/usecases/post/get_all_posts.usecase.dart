import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/post/post.repo.dart';

class GetAllPostsUsecase extends UsecaseWithParams<List<PostEntity>, LocationEntity> {
  const GetAllPostsUsecase(this._repo);
  final PostRepo _repo;

  @override
  ResultFuture<List<PostEntity>> call(LocationEntity params) async => await _repo.getAll(params);
}
