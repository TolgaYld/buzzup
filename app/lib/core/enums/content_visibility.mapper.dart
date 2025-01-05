// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'content_visibility.dart';

class ContentVisibilityMapper extends EnumMapper<ContentVisibility> {
  ContentVisibilityMapper._();

  static ContentVisibilityMapper? _instance;
  static ContentVisibilityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContentVisibilityMapper._());
    }
    return _instance!;
  }

  static ContentVisibility fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ContentVisibility decode(dynamic value) {
    switch (value) {
      case 'PUBLIC':
        return ContentVisibility.public;
      case 'ANONYMOUS':
        return ContentVisibility.anonymous;
      case 'PRIVATE':
        return ContentVisibility.private;
      case 'ONLY_FRIENDS':
        return ContentVisibility.onlyFriends;
      case 'ONLY_ME':
        return ContentVisibility.onlyMe;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ContentVisibility self) {
    switch (self) {
      case ContentVisibility.public:
        return 'PUBLIC';
      case ContentVisibility.anonymous:
        return 'ANONYMOUS';
      case ContentVisibility.private:
        return 'PRIVATE';
      case ContentVisibility.onlyFriends:
        return 'ONLY_FRIENDS';
      case ContentVisibility.onlyMe:
        return 'ONLY_ME';
    }
  }
}

extension ContentVisibilityMapperExtension on ContentVisibility {
  dynamic toValue() {
    ContentVisibilityMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ContentVisibility>(this);
  }
}
