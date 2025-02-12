import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/enums/content_visibility.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/story/story.repo.dart';

class CreatePostUsecase extends UsecaseWithParams<void, StoryEntity> {
  const CreatePostUsecase(this._repo);
  final StoryRepo _repo;

  @override
  ResultFuture<void> call(StoryEntity params) async => await _repo.create(params);

  static StoryEntity get emptyParams => StoryEntity(
        id: "empty_id",
        channels: [ChannelEntity.empty()],
        visibility: ContentVisibility.public,
        location: LocationEntity.empty(),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: UserEntity.empty(),
        isActive: true,
        isDeleted: false,
      );
}
