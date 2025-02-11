import 'package:buzzup/core/models/all_models.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/post/post.repo.dart';

class GetMyPostsUsecase extends UsecaseWithoutParams<List<Post>> {
  const GetMyPostsUsecase(this._repo);
  final PostRepo _repo;

  @override
  ResultFuture<List<Post>> call() async => await _repo.getMyPosts();
}
