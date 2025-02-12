import 'package:buzzup/core/common/data/models/all_models.dart';
import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/errors/exception.dart';
import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/data/datasources/post/post.remote.datasrc.dart';
import 'package:buzzup/src/domain/repositories/post/post.repo.dart';

class PostRepoImpl implements PostRepo {
  const PostRepoImpl(this._remoteDatasrc);

  final PostRemoteDatasrc _remoteDatasrc;

  @override
  ResultFuture<void> create(PostEntity post) async {
    try {
      await _remoteDatasrc.createPost(PostModel.fromEntity(post));
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
  ResultFuture<List<PostEntity>> getAll(LocationEntity? location) async {
    try {
      final result = await _remoteDatasrc.getAll();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<PostEntity> getById(String id) async {
    try {
      final result = await _remoteDatasrc.getById(id);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<PostEntity>> getMyPosts() async {
    try {
      final result = await _remoteDatasrc.getMyPosts();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<PostEntity>> getPostsByUser(String userId) async {
    try {
      final result = await _remoteDatasrc.getPostsByUser(userId);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> update(PostEntity post) async {
    try {
      await _remoteDatasrc.updatePost(PostModel.fromEntity(post));
      return Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
