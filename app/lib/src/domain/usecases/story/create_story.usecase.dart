import 'package:buzzup/core/enums/post_type.dart';
import 'package:buzzup/core/models/channel.dart';
import 'package:buzzup/core/models/location.dart';
import 'package:buzzup/core/models/story.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/story/story.repo.dart';

class CreatePostUsecase extends UsecaseWithParams<void, Story> {
  const CreatePostUsecase(this._repo);
  final StoryRepo _repo;

  @override
  ResultFuture<void> call(Story params) async => await _repo.create(params);

  static Story get emptyParams => Story(
        id: "empty_id",
        channels: [Channel.empty()],
        type: PostType.public,
        location: Location.empty(),
        createdAt: DateTime(2024),
        createdBy: User.empty(),
        isDeleted: false,
        isActive: true,
      );
}
