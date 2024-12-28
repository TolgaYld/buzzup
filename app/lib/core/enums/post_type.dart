import 'package:json_annotation/json_annotation.dart';

enum ContentType {
  @JsonValue('PUBLIC')
  public,
  @JsonValue('ANONYMOUS')
  anonymous
}
