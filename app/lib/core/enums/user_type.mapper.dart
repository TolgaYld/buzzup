// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_type.dart';

class UserTypeMapper extends EnumMapper<UserType> {
  UserTypeMapper._();

  static UserTypeMapper? _instance;
  static UserTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserTypeMapper._());
    }
    return _instance!;
  }

  static UserType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  UserType decode(dynamic value) {
    switch (value) {
      case 'SUPER_ADMIN':
        return UserType.superAdmin;
      case 'ADMIN':
        return UserType.admin;
      case 'USER':
        return UserType.user;
      case 'GUEST':
        return UserType.guest;
      case 'MARKETING':
        return UserType.marketing;
      case 'MODERATOR':
        return UserType.moderator;
      case 'EDITOR':
        return UserType.editor;
      case 'SUPPORT':
        return UserType.support;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(UserType self) {
    switch (self) {
      case UserType.superAdmin:
        return 'SUPER_ADMIN';
      case UserType.admin:
        return 'ADMIN';
      case UserType.user:
        return 'USER';
      case UserType.guest:
        return 'GUEST';
      case UserType.marketing:
        return 'MARKETING';
      case UserType.moderator:
        return 'MODERATOR';
      case UserType.editor:
        return 'EDITOR';
      case UserType.support:
        return 'SUPPORT';
    }
  }
}

extension UserTypeMapperExtension on UserType {
  dynamic toValue() {
    UserTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<UserType>(this);
  }
}
