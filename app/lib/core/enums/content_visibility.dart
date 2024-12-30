import 'package:json_annotation/json_annotation.dart';

enum ContentVisibility {
  @JsonValue('PUBLIC')
  public,
  @JsonValue('ANONYMOUS')
  anonymous,
  @JsonValue('PRIVATE')
  private,
  @JsonValue('ONLY_FRIENDS')
  onlyFriends,
  @JsonValue('ONLY_ME')
  onlyMe,
}
