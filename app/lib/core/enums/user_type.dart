import 'package:json_annotation/json_annotation.dart';

enum UserType {
  @JsonValue('SUPER_ADMIN')
  superAdmin,
  @JsonValue('ADMIN')
  admin,
  @JsonValue('USER')
  user,
  @JsonValue('GUEST')
  guest,
  @JsonValue('MARKETING')
  marketing,
  @JsonValue('MODERATOR')
  moderator,
  @JsonValue('EDITOR')
  editor,
  @JsonValue('SUPPORT')
  support,
}
