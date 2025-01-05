import 'package:dart_mappable/dart_mappable.dart';

part 'content_visibility.mapper.dart';

@MappableEnum()
enum ContentVisibility {
  @MappableValue('PUBLIC')
  public,
  @MappableValue('ANONYMOUS')
  anonymous,
  @MappableValue('PRIVATE')
  private,
  @MappableValue('ONLY_FRIENDS')
  onlyFriends,
  @MappableValue('ONLY_ME')
  onlyMe,
}
