import 'package:dart_mappable/dart_mappable.dart';

part 'user_type.mapper.dart';

@MappableEnum()
enum UserType {
  @MappableValue('SUPER_ADMIN')
  superAdmin,
  @MappableValue('ADMIN')
  admin,
  @MappableValue('USER')
  user,
  @MappableValue('GUEST')
  guest,
  @MappableValue('MARKETING')
  marketing,
  @MappableValue('MODERATOR')
  moderator,
  @MappableValue('EDITOR')
  editor,
  @MappableValue('SUPPORT')
  support,
}
