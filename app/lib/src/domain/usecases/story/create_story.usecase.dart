import 'package:buzzup/core/enums/post_type.dart';
import 'package:buzzup/core/models/channel.dart';
import 'package:buzzup/core/models/content.dart';
import 'package:buzzup/core/models/location.dart';
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
        type: ContentType.public,
        location: Location.empty(),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: User.empty(),
        isActive: true,
        isDeleted: false,
      );
}
