import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/common/domain/repo/crud.repo.dart';
import 'package:buzzup/core/utils/typedefs.dart';

abstract interface class StoryRepo implements CrudRepo<StoryEntity> {
  const StoryRepo();

  ResultFuture<List<StoryEntity>> getStorysByUser(String userId);
  ResultFuture<List<StoryEntity>> getMyStorys();
}
