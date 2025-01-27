import 'package:buzzup/core/dependency_provider/api_client.provider.dart';
import 'package:buzzup/src/data/datasources/post/post.remote.datasrc.dart';
import 'package:buzzup/src/data/repositories/post/post.repo.impl.dart';
import 'package:buzzup/src/domain/repositories/post/post.repo.dart';
import 'package:buzzup/src/domain/usecases/post/create_post.usecase.dart';
import 'package:buzzup/src/domain/usecases/post/delete_post.usecase.dart';
import 'package:buzzup/src/domain/usecases/post/get_all_posts.usecase.dart';
import 'package:buzzup/src/domain/usecases/post/get_my_posts.usecase.dart';
import 'package:buzzup/src/domain/usecases/post/get_post.usecase.dart';
import 'package:buzzup/src/domain/usecases/post/get_posts_by_user.usecase.dart';
import 'package:buzzup/src/domain/usecases/post/update_post.usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postRemoteDatasourceProvider = FutureProvider<PostRemoteDatasrc>((ref) async {
  final client = await ref.watch(graphQLClientProvider.future);
  return PostRemoteDatasrcImpl(client);
});

final postRepoProvider = FutureProvider<PostRepo>((ref) async {
  final remoteDatasrc = await ref.watch(postRemoteDatasourceProvider.future);
  return PostRepoImpl(remoteDatasrc);
});

final createPostUsecaseProvider = FutureProvider<CreatePostUsecase>((ref) async {
  final postRepo = await ref.watch(postRepoProvider.future);
  return CreatePostUsecase(postRepo);
});

final updatePostUsecaseProvider = FutureProvider<UpdatePostUsecase>((ref) async {
  final postRepo = await ref.watch(postRepoProvider.future);
  return UpdatePostUsecase(postRepo);
});

final deletePostUsecaseProvider = FutureProvider<DeletePostUsecase>((ref) async {
  final postRepo = await ref.watch(postRepoProvider.future);
  return DeletePostUsecase(postRepo);
});

final getMyPostsUsecaseProvider = FutureProvider<GetMyPostsUsecase>((ref) async {
  final postRepo = await ref.watch(postRepoProvider.future);
  return GetMyPostsUsecase(postRepo);
});

final getPostsByUserUsecaseProvider = FutureProvider<GetPostsByUserUsecase>((ref) async {
  final postRepo = await ref.watch(postRepoProvider.future);
  return GetPostsByUserUsecase(postRepo);
});

final getPostByIdUsecaseProvider = FutureProvider<GetPostUsecase>((ref) async {
  final postRepo = await ref.watch(postRepoProvider.future);
  return GetPostUsecase(postRepo);
});

final getAllPostsUsecaseProvider = FutureProvider<GetAllPostsUsecase>((ref) async {
  final postRepo = await ref.watch(postRepoProvider.future);
  return GetAllPostsUsecase(postRepo);
});
