import 'package:json_annotation/json_annotation.dart';

enum AuthProvider {
  @JsonValue('LOCAL')
  local,
  @JsonValue('GOOGLE')
  google,
  @JsonValue('APPLE')
  apple,
}
