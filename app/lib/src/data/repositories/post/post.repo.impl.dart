import 'package:buzzup/core/errors/exception.dart';
import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/models/content.dart';
import 'package:buzzup/core/models/location.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/data/datasources/post/post.remote.datasrc.dart';
import 'package:buzzup/src/domain/repositories/post/post.repo.dart';

class PostRepoImpl implements PostRepo {
  const PostRepoImpl(this._remoteDatasrc);

  final PostRemoteDatasrc _remoteDatasrc;

  @override
  ResultFuture<void> create(Post post) async {
    try {
      await _remoteDatasrc.createPost(post);
      return Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> delete(String id) async {
    try {
      await _remoteDatasrc.deletePost(id);
      return Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Post>> getAll(Location? location) async {
    try {
      final result = await _remoteDatasrc.getAll();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Post> getById(String id) async {
    try {
      final result = await _remoteDatasrc.getById(id);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Post>> getMyPosts() async {
    try {
      final result = await _remoteDatasrc.getMyPosts();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Post>> getPostsByUser(String userId) async {
    try {
      final result = await _remoteDatasrc.getPostsByUser(userId);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> update(Post post) async {
    try {
      await _remoteDatasrc.updatePost(post);
      return Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
