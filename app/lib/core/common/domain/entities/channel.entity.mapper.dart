// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'channel.entity.dart';

class ChannelEntityMapper extends ClassMapperBase<ChannelEntity> {
  ChannelEntityMapper._();

  static ChannelEntityMapper? _instance;
  static ChannelEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChannelEntityMapper._());
      UserEntityMapper.ensureInitialized();
      PostEntityMapper.ensureInitialized();
      StoryEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChannelEntity';

  static String _$id(ChannelEntity v) => v.id;
  static const Field<ChannelEntity, String> _f$id = Field('id', _$id);
  static String _$name(ChannelEntity v) => v.name;
  static const Field<ChannelEntity, String> _f$name = Field('name', _$name);
  static bool _$isActive(ChannelEntity v) => v.isActive;
  static const Field<ChannelEntity, bool> _f$isActive =
      Field('isActive', _$isActive);
  static bool _$isDeleted(ChannelEntity v) => v.isDeleted;
  static const Field<ChannelEntity, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted);
  static DateTime _$createdAt(ChannelEntity v) => v.createdAt;
  static const Field<ChannelEntity, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static List<UserEntity>? _$subscriptions(ChannelEntity v) => v.subscriptions;
  static const Field<ChannelEntity, List<UserEntity>> _f$subscriptions =
      Field('subscriptions', _$subscriptions, opt: true);
  static UserEntity? _$createdBy(ChannelEntity v) => v.createdBy;
  static const Field<ChannelEntity, UserEntity> _f$createdBy =
      Field('createdBy', _$createdBy, opt: true);
  static List<PostEntity>? _$posts(ChannelEntity v) => v.posts;
  static const Field<ChannelEntity, List<PostEntity>> _f$posts =
      Field('posts', _$posts, opt: true);
  static List<StoryEntity>? _$storys(ChannelEntity v) => v.storys;
  static const Field<ChannelEntity, List<StoryEntity>> _f$storys =
      Field('storys', _$storys, opt: true);

  @override
  final MappableFields<ChannelEntity> fields = const {
    #id: _f$id,
    #name: _f$name,
    #isActive: _f$isActive,
    #isDeleted: _f$isDeleted,
    #createdAt: _f$createdAt,
    #subscriptions: _f$subscriptions,
    #createdBy: _f$createdBy,
    #posts: _f$posts,
    #storys: _f$storys,
  };

  static ChannelEntity _instantiate(DecodingData data) {
    return ChannelEntity(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        isActive: data.dec(_f$isActive),
        isDeleted: data.dec(_f$isDeleted),
        createdAt: data.dec(_f$createdAt),
        subscriptions: data.dec(_f$subscriptions),
        createdBy: data.dec(_f$createdBy),
        posts: data.dec(_f$posts),
        storys: data.dec(_f$storys));
  }

  @override
  final Function instantiate = _instantiate;

  static ChannelEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChannelEntity>(map);
  }

  static ChannelEntity fromJson(String json) {
    return ensureInitialized().decodeJson<ChannelEntity>(json);
  }
}

mixin ChannelEntityMappable {
  String toJson() {
    return ChannelEntityMapper.ensureInitialized()
        .encodeJson<ChannelEntity>(this as ChannelEntity);
  }

  Map<String, dynamic> toMap() {
    return ChannelEntityMapper.ensureInitialized()
        .encodeMap<ChannelEntity>(this as ChannelEntity);
  }

  ChannelEntityCopyWith<ChannelEntity, ChannelEntity, ChannelEntity>
      get copyWith => _ChannelEntityCopyWithImpl(
          this as ChannelEntity, $identity, $identity);
  @override
  String toString() {
    return ChannelEntityMapper.ensureInitialized()
        .stringifyValue(this as ChannelEntity);
  }

  @override
  bool operator ==(Object other) {
    return ChannelEntityMapper.ensureInitialized()
        .equalsValue(this as ChannelEntity, other);
  }

  @override
  int get hashCode {
    return ChannelEntityMapper.ensureInitialized()
        .hashValue(this as ChannelEntity);
  }
}

extension ChannelEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChannelEntity, $Out> {
  ChannelEntityCopyWith<$R, ChannelEntity, $Out> get $asChannelEntity =>
      $base.as((v, t, t2) => _ChannelEntityCopyWithImpl(v, t, t2));
}

abstract class ChannelEntityCopyWith<$R, $In extends ChannelEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get subscriptions;
  UserEntityCopyWith<$R, UserEntity, UserEntity>? get createdBy;
  ListCopyWith<$R, PostEntity, PostEntityCopyWith<$R, PostEntity, PostEntity>>?
      get posts;
  ListCopyWith<$R, StoryEntity,
      StoryEntityCopyWith<$R, StoryEntity, StoryEntity>>? get storys;
  $R call(
      {String? id,
      String? name,
      bool? isActive,
      bool? isDeleted,
      DateTime? createdAt,
      List<UserEntity>? subscriptions,
      UserEntity? createdBy,
      List<PostEntity>? posts,
      List<StoryEntity>? storys});
  ChannelEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChannelEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChannelEntity, $Out>
    implements ChannelEntityCopyWith<$R, ChannelEntity, $Out> {
  _ChannelEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChannelEntity> $mapper =
      ChannelEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get subscriptions => $value.subscriptions != null
          ? ListCopyWith($value.subscriptions!, (v, t) => v.copyWith.$chain(t),
              (v) => call(subscriptions: v))
          : null;
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity>? get createdBy =>
      $value.createdBy?.copyWith.$chain((v) => call(createdBy: v));
  @override
  ListCopyWith<$R, PostEntity, PostEntityCopyWith<$R, PostEntity, PostEntity>>?
      get posts => $value.posts != null
          ? ListCopyWith($value.posts!, (v, t) => v.copyWith.$chain(t),
              (v) => call(posts: v))
          : null;
  @override
  ListCopyWith<$R, StoryEntity,
          StoryEntityCopyWith<$R, StoryEntity, StoryEntity>>?
      get storys => $value.storys != null
          ? ListCopyWith($value.storys!, (v, t) => v.copyWith.$chain(t),
              (v) => call(storys: v))
          : null;
  @override
  $R call(
          {String? id,
          String? name,
          bool? isActive,
          bool? isDeleted,
          DateTime? createdAt,
          Object? subscriptions = $none,
          Object? createdBy = $none,
          Object? posts = $none,
          Object? storys = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (isActive != null) #isActive: isActive,
        if (isDeleted != null) #isDeleted: isDeleted,
        if (createdAt != null) #createdAt: createdAt,
        if (subscriptions != $none) #subscriptions: subscriptions,
        if (createdBy != $none) #createdBy: createdBy,
        if (posts != $none) #posts: posts,
        if (storys != $none) #storys: storys
      }));
  @override
  ChannelEntity $make(CopyWithData data) => ChannelEntity(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      isActive: data.get(#isActive, or: $value.isActive),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      subscriptions: data.get(#subscriptions, or: $value.subscriptions),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      posts: data.get(#posts, or: $value.posts),
      storys: data.get(#storys, or: $value.storys));

  @override
  ChannelEntityCopyWith<$R2, ChannelEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChannelEntityCopyWithImpl($value, $cast, t);
}
