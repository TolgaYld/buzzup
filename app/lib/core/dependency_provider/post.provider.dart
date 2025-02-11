import 'package:buzzup/core/common/constants/firebase_keys.dart';
import 'package:buzzup/core/common/provider/firestore/firestore.provider.dart';
import 'package:buzzup/core/common/provider/storage/storage.provider.dart';
import 'package:buzzup/core/dependency_provider/api_client.provider.dart';
import 'package:buzzup/core/models/all_models.dart';
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
  final storage = ref.watch(storageProvider);
  final firestore = ref.watch(firestoreProvider);
  final collectionReference = firestore.collection(FirebaseKeys.uploadJobs).withConverter<UploadJob>(
        fromFirestore: (snap, _) => UploadJobMapper.fromMap(
          switch (snap.data()) {
            final data? => data,
            _ => throw Exception("Data not found"),
          },
        ),
        toFirestore: (value, _) => value.toMap(),
      );
  return PostRemoteDatasrcImpl(client: client, storage: storage, collectionReference: collectionReference);
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
