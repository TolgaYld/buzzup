import 'package:buzzup/core/models/content.dart';
import 'package:buzzup/core/models/location.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/post/post.repo.dart';

class PostRepoImpl implements PostRepo {
  @override
  ResultFuture<void> create(Post item) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> delete(String id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<Post>> getAll(Location location) async {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  ResultFuture<Post> getById(String id) async {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<Post>> getMyPosts() async {
    // TODO: implement getMyPosts
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<Post>> getPostsByUser(String userId) async {
    // TODO: implement getPostsByUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> update(Post item) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
