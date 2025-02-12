// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'channel.model.dart';

class ChannelModelMapper extends ClassMapperBase<ChannelModel> {
  ChannelModelMapper._();

  static ChannelModelMapper? _instance;
  static ChannelModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChannelModelMapper._());
      ChannelEntityMapper.ensureInitialized();
      UserEntityMapper.ensureInitialized();
      UserModelMapper.ensureInitialized();
      PostEntityMapper.ensureInitialized();
      StoryEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChannelModel';

  static String _$id(ChannelModel v) => v.id;
  static const Field<ChannelModel, String> _f$id =
      Field('id', _$id, key: r'_id');
  static String _$name(ChannelModel v) => v.name;
  static const Field<ChannelModel, String> _f$name = Field('name', _$name);
  static bool _$isActive(ChannelModel v) => v.isActive;
  static const Field<ChannelModel, bool> _f$isActive =
      Field('isActive', _$isActive, key: r'is_active');
  static bool _$isDeleted(ChannelModel v) => v.isDeleted;
  static const Field<ChannelModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: r'is_deleted');
  static DateTime _$createdAt(ChannelModel v) => v.createdAt;
  static const Field<ChannelModel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static List<UserEntity>? _$subscriptions(ChannelModel v) => v.subscriptions;
  static const Field<ChannelModel, List<UserEntity>> _f$subscriptions =
      Field('subscriptions', _$subscriptions, opt: true);
  static UserEntity? _$createdBy(ChannelModel v) => v.createdBy;
  static dynamic _arg$createdBy(f) => f<UserEntity>();
  static const Field<ChannelModel, UserModel> _f$createdBy = Field(
      'createdBy', _$createdBy,
      key: r'created_by', opt: true, arg: _arg$createdBy);
  static List<PostEntity>? _$posts(ChannelModel v) => v.posts;
  static const Field<ChannelModel, List<PostEntity>> _f$posts =
      Field('posts', _$posts, opt: true);
  static List<StoryEntity>? _$storys(ChannelModel v) => v.storys;
  static const Field<ChannelModel, List<StoryEntity>> _f$storys =
      Field('storys', _$storys, opt: true);

  @override
  final MappableFields<ChannelModel> fields = const {
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

  static ChannelModel _instantiate(DecodingData data) {
    return ChannelModel(
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

  static ChannelModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChannelModel>(map);
  }

  static ChannelModel fromJson(String json) {
    return ensureInitialized().decodeJson<ChannelModel>(json);
  }
}

mixin ChannelModelMappable {
  String toJson() {
    return ChannelModelMapper.ensureInitialized()
        .encodeJson<ChannelModel>(this as ChannelModel);
  }

  Map<String, dynamic> toMap() {
    return ChannelModelMapper.ensureInitialized()
        .encodeMap<ChannelModel>(this as ChannelModel);
  }

  ChannelModelCopyWith<ChannelModel, ChannelModel, ChannelModel> get copyWith =>
      _ChannelModelCopyWithImpl(this as ChannelModel, $identity, $identity);
  @override
  String toString() {
    return ChannelModelMapper.ensureInitialized()
        .stringifyValue(this as ChannelModel);
  }

  @override
  bool operator ==(Object other) {
    return ChannelModelMapper.ensureInitialized()
        .equalsValue(this as ChannelModel, other);
  }

  @override
  int get hashCode {
    return ChannelModelMapper.ensureInitialized()
        .hashValue(this as ChannelModel);
  }
}

extension ChannelModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChannelModel, $Out> {
  ChannelModelCopyWith<$R, ChannelModel, $Out> get $asChannelModel =>
      $base.as((v, t, t2) => _ChannelModelCopyWithImpl(v, t, t2));
}

abstract class ChannelModelCopyWith<$R, $In extends ChannelModel, $Out>
    implements ChannelEntityCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get subscriptions;
  @override
  UserModelCopyWith<$R, UserModel, UserModel>? get createdBy;
  @override
  ListCopyWith<$R, PostEntity, PostEntityCopyWith<$R, PostEntity, PostEntity>>?
      get posts;
  @override
  ListCopyWith<$R, StoryEntity,
      StoryEntityCopyWith<$R, StoryEntity, StoryEntity>>? get storys;
  @override
  $R call(
      {String? id,
      String? name,
      bool? isActive,
      bool? isDeleted,
      DateTime? createdAt,
      List<UserEntity>? subscriptions,
      covariant UserModel? createdBy,
      List<PostEntity>? posts,
      List<StoryEntity>? storys});
  ChannelModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChannelModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChannelModel, $Out>
    implements ChannelModelCopyWith<$R, ChannelModel, $Out> {
  _ChannelModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChannelModel> $mapper =
      ChannelModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get subscriptions => $value.subscriptions != null
          ? ListCopyWith($value.subscriptions!, (v, t) => v.copyWith.$chain(t),
              (v) => call(subscriptions: v))
          : null;
  @override
  UserModelCopyWith<$R, UserModel, UserModel>? get createdBy =>
      ($value.createdBy as UserModel?)
          ?.copyWith
          .$chain((v) => call(createdBy: v));
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
  ChannelModel $make(CopyWithData data) => ChannelModel(
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
  ChannelModelCopyWith<$R2, ChannelModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChannelModelCopyWithImpl($value, $cast, t);
}
