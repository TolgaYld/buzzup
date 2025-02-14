import 'package:buzzup/core/common/data/models/all_models.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract interface class PostRemoteDatasrc {
  const PostRemoteDatasrc();

  Future<void> createPost(PostModel post);
  Future<void> updatePost(PostModel post);
  Future<void> deletePost(String id);
  Future<List<PostModel>> getAll();
  Future<PostModel> getById(String id);
  Future<List<PostModel>> getMyPosts();
  Future<List<PostModel>> getPostsByUser(String userId);
}

class PostRemoteDatasrcImpl implements PostRemoteDatasrc {
  const PostRemoteDatasrcImpl(this._client);
  final GraphQLClient _client;

  @override
  Future<void> createPost(PostModel post) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(String id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<PostModel> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getMyPosts() {
    // TODO: implement getMyPosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getPostsByUser(String userId) {
    // TODO: implement getPostsByUser
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(PostModel post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
