import 'package:buzzup/core/common/repo/crud.repo.dart';
import 'package:buzzup/core/models/all_models.dart';
import 'package:buzzup/core/utils/typedefs.dart';

abstract interface class StoryRepo implements CrudRepo<Story> {
  const StoryRepo();

  ResultFuture<List<Story>> getStorysByUser(String userId);
  ResultFuture<List<Story>> getMyStorys();
}
