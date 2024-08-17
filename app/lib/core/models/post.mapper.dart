// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post.dart';

class PostMapper extends ClassMapperBase<Post> {
  PostMapper._();

  static PostMapper? _instance;
  static PostMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostMapper._());
      UserMapper.ensureInitialized();
      LocationMapper.ensureInitialized();
      ChannelMapper.ensureInitialized();
      CommentMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Post';

  static String _$id(Post v) => v.id;
  static const Field<Post, String> _f$id = Field('id', _$id, key: '_id');
  static bool _$isActive(Post v) => v.isActive;
  static const Field<Post, bool> _f$isActive =
      Field('isActive', _$isActive, key: 'is_active');
  static bool _$isDeleted(Post v) => v.isDeleted;
  static const Field<Post, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: 'is_deleted');
  static User _$createdBy(Post v) => v.createdBy;
  static const Field<Post, User> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by');
  static DateTime _$createdAt(Post v) => v.createdAt;
  static const Field<Post, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: 'created_at');
  static Location _$location(Post v) => v.location;
  static const Field<Post, Location> _f$location =
      Field('location', _$location);
  static PostType _$type(Post v) => v.type;
  static const Field<Post, PostType> _f$type = Field('type', _$type);
  static List<Channel>? _$channels(Post v) => v.channels;
  static const Field<Post, List<Channel>> _f$channels =
      Field('channels', _$channels);
  static List<User>? _$likes(Post v) => v.likes;
  static const Field<Post, List<User>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<User>? _$dislikes(Post v) => v.dislikes;
  static const Field<Post, List<User>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(Post v) => v.text;
  static const Field<Post, String> _f$text = Field('text', _$text, opt: true);
  static List<String>? _$media(Post v) => v.media;
  static const Field<Post, List<String>> _f$media =
      Field('media', _$media, opt: true);
  static String? _$city(Post v) => v.city;
  static const Field<Post, String> _f$city = Field('city', _$city, opt: true);
  static List<Comment>? _$comments(Post v) => v.comments;
  static const Field<Post, List<Comment>> _f$comments =
      Field('comments', _$comments, opt: true);

  @override
  final MappableFields<Post> fields = const {
    #id: _f$id,
    #isActive: _f$isActive,
    #isDeleted: _f$isDeleted,
    #createdBy: _f$createdBy,
    #createdAt: _f$createdAt,
    #location: _f$location,
    #type: _f$type,
    #channels: _f$channels,
    #likes: _f$likes,
    #dislikes: _f$dislikes,
    #text: _f$text,
    #media: _f$media,
    #city: _f$city,
    #comments: _f$comments,
  };

  static Post _instantiate(DecodingData data) {
    return Post(
        id: data.dec(_f$id),
        isActive: data.dec(_f$isActive),
        isDeleted: data.dec(_f$isDeleted),
        createdBy: data.dec(_f$createdBy),
        createdAt: data.dec(_f$createdAt),
        location: data.dec(_f$location),
        type: data.dec(_f$type),
        channels: data.dec(_f$channels),
        likes: data.dec(_f$likes),
        dislikes: data.dec(_f$dislikes),
        text: data.dec(_f$text),
        media: data.dec(_f$media),
        city: data.dec(_f$city),
        comments: data.dec(_f$comments));
  }

  @override
  final Function instantiate = _instantiate;

  static Post fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Post>(map);
  }

  static Post fromJson(String json) {
    return ensureInitialized().decodeJson<Post>(json);
  }
}

mixin PostMappable {
  String toJson() {
    return PostMapper.ensureInitialized().encodeJson<Post>(this as Post);
  }

  Map<String, dynamic> toMap() {
    return PostMapper.ensureInitialized().encodeMap<Post>(this as Post);
  }

  PostCopyWith<Post, Post, Post> get copyWith =>
      _PostCopyWithImpl(this as Post, $identity, $identity);
  @override
  String toString() {
    return PostMapper.ensureInitialized().stringifyValue(this as Post);
  }

  @override
  bool operator ==(Object other) {
    return PostMapper.ensureInitialized().equalsValue(this as Post, other);
  }

  @override
  int get hashCode {
    return PostMapper.ensureInitialized().hashValue(this as Post);
  }
}

extension PostValueCopy<$R, $Out> on ObjectCopyWith<$R, Post, $Out> {
  PostCopyWith<$R, Post, $Out> get $asPost =>
      $base.as((v, t, t2) => _PostCopyWithImpl(v, t, t2));
}

abstract class PostCopyWith<$R, $In extends Post, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User> get createdBy;
  LocationCopyWith<$R, Location, Location> get location;
  ListCopyWith<$R, Channel, ChannelCopyWith<$R, Channel, Channel>>?
      get channels;
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get likes;
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get dislikes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get media;
  ListCopyWith<$R, Comment, CommentCopyWith<$R, Comment, Comment>>?
      get comments;
  $R call(
      {String? id,
      bool? isActive,
      bool? isDeleted,
      User? createdBy,
      DateTime? createdAt,
      Location? location,
      PostType? type,
      List<Channel>? channels,
      List<User>? likes,
      List<User>? dislikes,
      String? text,
      List<String>? media,
      String? city,
      List<Comment>? comments});
  PostCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Post, $Out>
    implements PostCopyWith<$R, Post, $Out> {
  _PostCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Post> $mapper = PostMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User> get createdBy =>
      $value.createdBy.copyWith.$chain((v) => call(createdBy: v));
  @override
  LocationCopyWith<$R, Location, Location> get location =>
      $value.location.copyWith.$chain((v) => call(location: v));
  @override
  ListCopyWith<$R, Channel, ChannelCopyWith<$R, Channel, Channel>>?
      get channels => $value.channels != null
          ? ListCopyWith($value.channels!, (v, t) => v.copyWith.$chain(t),
              (v) => call(channels: v))
          : null;
  @override
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get likes =>
      $value.likes != null
          ? ListCopyWith($value.likes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(likes: v))
          : null;
  @override
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get dislikes =>
      $value.dislikes != null
          ? ListCopyWith($value.dislikes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(dislikes: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get media =>
      $value.media != null
          ? ListCopyWith($value.media!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(media: v))
          : null;
  @override
  ListCopyWith<$R, Comment, CommentCopyWith<$R, Comment, Comment>>?
      get comments => $value.comments != null
          ? ListCopyWith($value.comments!, (v, t) => v.copyWith.$chain(t),
              (v) => call(comments: v))
          : null;
  @override
  $R call(
          {String? id,
          bool? isActive,
          bool? isDeleted,
          User? createdBy,
          DateTime? createdAt,
          Location? location,
          PostType? type,
          Object? channels = $none,
          Object? likes = $none,
          Object? dislikes = $none,
          Object? text = $none,
          Object? media = $none,
          Object? city = $none,
          Object? comments = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (isActive != null) #isActive: isActive,
        if (isDeleted != null) #isDeleted: isDeleted,
        if (createdBy != null) #createdBy: createdBy,
        if (createdAt != null) #createdAt: createdAt,
        if (location != null) #location: location,
        if (type != null) #type: type,
        if (channels != $none) #channels: channels,
        if (likes != $none) #likes: likes,
        if (dislikes != $none) #dislikes: dislikes,
        if (text != $none) #text: text,
        if (media != $none) #media: media,
        if (city != $none) #city: city,
        if (comments != $none) #comments: comments
      }));
  @override
  Post $make(CopyWithData data) => Post(
      id: data.get(#id, or: $value.id),
      isActive: data.get(#isActive, or: $value.isActive),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      location: data.get(#location, or: $value.location),
      type: data.get(#type, or: $value.type),
      channels: data.get(#channels, or: $value.channels),
      likes: data.get(#likes, or: $value.likes),
      dislikes: data.get(#dislikes, or: $value.dislikes),
      text: data.get(#text, or: $value.text),
      media: data.get(#media, or: $value.media),
      city: data.get(#city, or: $value.city),
      comments: data.get(#comments, or: $value.comments));

  @override
  PostCopyWith<$R2, Post, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PostCopyWithImpl($value, $cast, t);
}
