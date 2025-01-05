import 'package:dart_mappable/dart_mappable.dart';

part "auth_provider.mapper.dart";

@MappableEnum()
enum AuthProvider {
  @MappableValue('LOCAL')
  local,
  @MappableValue('GOOGLE')
  google,
  @MappableValue('APPLE')
  apple,
}
