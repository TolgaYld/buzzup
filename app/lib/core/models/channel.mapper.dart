// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'channel.dart';

class ChannelMapper extends ClassMapperBase<Channel> {
  ChannelMapper._();

  static ChannelMapper? _instance;
  static ChannelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChannelMapper._());
      UserMapper.ensureInitialized();
      PostMapper.ensureInitialized();
      StoryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Channel';

  static String _$id(Channel v) => v.id;
  static const Field<Channel, String> _f$id = Field('id', _$id, key: '_id');
  static String _$name(Channel v) => v.name;
  static const Field<Channel, String> _f$name = Field('name', _$name);
  static bool _$isActive(Channel v) => v.isActive;
  static const Field<Channel, bool> _f$isActive =
      Field('isActive', _$isActive, key: 'is_active');
  static bool _$isDeleted(Channel v) => v.isDeleted;
  static const Field<Channel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: 'is_deleted');
  static DateTime _$createdAt(Channel v) => v.createdAt;
  static const Field<Channel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: 'created_at');
  static List<User>? _$subscriptions(Channel v) => v.subscriptions;
  static const Field<Channel, List<User>> _f$subscriptions =
      Field('subscriptions', _$subscriptions, opt: true);
  static User? _$createdBy(Channel v) => v.createdBy;
  static const Field<Channel, User> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by', opt: true);
  static List<Post>? _$posts(Channel v) => v.posts;
  static const Field<Channel, List<Post>> _f$posts =
      Field('posts', _$posts, opt: true);
  static List<Story>? _$storys(Channel v) => v.storys;
  static const Field<Channel, List<Story>> _f$storys =
      Field('storys', _$storys, opt: true);

  @override
  final MappableFields<Channel> fields = const {
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

  static Channel _instantiate(DecodingData data) {
    return Channel(
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

  static Channel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Channel>(map);
  }

  static Channel fromJson(String json) {
    return ensureInitialized().decodeJson<Channel>(json);
  }
}

mixin ChannelMappable {
  String toJson() {
    return ChannelMapper.ensureInitialized()
        .encodeJson<Channel>(this as Channel);
  }

  Map<String, dynamic> toMap() {
    return ChannelMapper.ensureInitialized()
        .encodeMap<Channel>(this as Channel);
  }

  ChannelCopyWith<Channel, Channel, Channel> get copyWith =>
      _ChannelCopyWithImpl(this as Channel, $identity, $identity);
  @override
  String toString() {
    return ChannelMapper.ensureInitialized().stringifyValue(this as Channel);
  }

  @override
  bool operator ==(Object other) {
    return ChannelMapper.ensureInitialized()
        .equalsValue(this as Channel, other);
  }

  @override
  int get hashCode {
    return ChannelMapper.ensureInitialized().hashValue(this as Channel);
  }
}

extension ChannelValueCopy<$R, $Out> on ObjectCopyWith<$R, Channel, $Out> {
  ChannelCopyWith<$R, Channel, $Out> get $asChannel =>
      $base.as((v, t, t2) => _ChannelCopyWithImpl(v, t, t2));
}

abstract class ChannelCopyWith<$R, $In extends Channel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get subscriptions;
  UserCopyWith<$R, User, User>? get createdBy;
  ListCopyWith<$R, Post, PostCopyWith<$R, Post, Post>>? get posts;
  ListCopyWith<$R, Story, StoryCopyWith<$R, Story, Story>>? get storys;
  $R call(
      {String? id,
      String? name,
      bool? isActive,
      bool? isDeleted,
      DateTime? createdAt,
      List<User>? subscriptions,
      User? createdBy,
      List<Post>? posts,
      List<Story>? storys});
  ChannelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChannelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Channel, $Out>
    implements ChannelCopyWith<$R, Channel, $Out> {
  _ChannelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Channel> $mapper =
      ChannelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get subscriptions =>
      $value.subscriptions != null
          ? ListCopyWith($value.subscriptions!, (v, t) => v.copyWith.$chain(t),
              (v) => call(subscriptions: v))
          : null;
  @override
  UserCopyWith<$R, User, User>? get createdBy =>
      $value.createdBy?.copyWith.$chain((v) => call(createdBy: v));
  @override
  ListCopyWith<$R, Post, PostCopyWith<$R, Post, Post>>? get posts =>
      $value.posts != null
          ? ListCopyWith($value.posts!, (v, t) => v.copyWith.$chain(t),
              (v) => call(posts: v))
          : null;
  @override
  ListCopyWith<$R, Story, StoryCopyWith<$R, Story, Story>>? get storys =>
      $value.storys != null
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
  Channel $make(CopyWithData data) => Channel(
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
  ChannelCopyWith<$R2, Channel, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ChannelCopyWithImpl($value, $cast, t);
}
