import 'package:buzzup/core/common/repo/crud.repo.dart';
import 'package:buzzup/core/models/content.dart';
import 'package:buzzup/core/utils/typedefs.dart';

abstract interface class PostRepo implements CrudRepo<Post> {
  const PostRepo();

  ResultFuture<List<Post>> getPostsByUser(String userId);
  ResultFuture<List<Post>> getMyPosts();
}
