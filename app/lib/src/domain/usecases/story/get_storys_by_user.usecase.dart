import 'package:buzzup/core/models/content.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/post/post.repo.dart';

class GetPostsByUserUsecase extends UsecaseWithParams<List<Post>, String> {
  const GetPostsByUserUsecase(this._repo);
  final PostRepo _repo;

  @override
  ResultFuture<List<Post>> call(String params) async => await _repo.getPostsByUser(params);
}
