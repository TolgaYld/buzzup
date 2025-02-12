import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/post/post.repo.dart';

class GetMyPostsUsecase extends UsecaseWithoutParams<List<PostEntity>> {
  const GetMyPostsUsecase(this._repo);
  final PostRepo _repo;

  @override
  ResultFuture<List<PostEntity>> call() async => await _repo.getMyPosts();
}
