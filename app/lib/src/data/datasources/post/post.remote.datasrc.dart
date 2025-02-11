import 'package:buzzup/core/models/all_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract interface class PostRemoteDatasrc {
  const PostRemoteDatasrc();

  Future<void> createPost(Post post);
  Future<void> updatePost(Post post);
  Future<void> deletePost(String id);
  Future<List<Post>> getAll();
  Future<Post> getById(String id);
  Future<List<Post>> getMyPosts();
  Future<List<Post>> getPostsByUser(String userId);
}

class PostRemoteDatasrcImpl implements PostRemoteDatasrc {
  const PostRemoteDatasrcImpl({
    required GraphQLClient client,
    required CollectionReference collectionReference,
    required FirebaseStorage storage,
  })  : _client = client,
        _storage = storage;
  final GraphQLClient _client;
  final FirebaseStorage _storage;

  @override
  Future<void> createPost(Post post) async {}

  @override
  Future<void> deletePost(String id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Post> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getMyPosts() {
    // TODO: implement getMyPosts
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPostsByUser(String userId) {
    // TODO: implement getPostsByUser
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
