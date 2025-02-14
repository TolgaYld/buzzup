import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/common/domain/repo/crud.repo.dart';
import 'package:buzzup/core/utils/typedefs.dart';

abstract interface class PostRepo implements CrudRepo<PostEntity> {
  ResultFuture<List<PostEntity>> getPostsByUser(String userId);
  ResultFuture<List<PostEntity>> getMyPosts();
}
