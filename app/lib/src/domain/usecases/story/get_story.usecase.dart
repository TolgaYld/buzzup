import 'package:buzzup/core/models/post.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/post/post.repo.dart';

class GetPostUsecase extends UsecaseWithParams<Post, String> {
  const GetPostUsecase(this._repo);
  final PostRepo _repo;
  @override
  ResultFuture<Post> call(String params) async => await _repo.getById(params);
}
