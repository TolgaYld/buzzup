import 'package:json_annotation/json_annotation.dart';

enum PostType {
  @JsonValue('PUBLIC')
  public,
  @JsonValue('ANONYMOUS')
  anonymous
}
