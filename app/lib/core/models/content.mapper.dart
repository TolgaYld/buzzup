// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'content.dart';

class ContentMapper extends ClassMapperBase<Content> {
  ContentMapper._();

  static ContentMapper? _instance;
  static ContentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContentMapper._());
      PostMapper.ensureInitialized();
      StoryMapper.ensureInitialized();
      ChannelMapper.ensureInitialized();
      LocationMapper.ensureInitialized();
      UserMapper.ensureInitialized();
      CommentMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Content';

  static String _$id(Content v) => v.id;
  static const Field<Content, String> _f$id = Field('id', _$id);
  static List<Channel>? _$channels(Content v) => v.channels;
  static const Field<Content, List<Channel>> _f$channels =
      Field('channels', _$channels);
  static Location _$location(Content v) => v.location;
  static const Field<Content, Location> _f$location =
      Field('location', _$location);
  static ContentType _$type(Content v) => v.type;
  static const Field<Content, ContentType> _f$type = Field('type', _$type);
  static bool _$isActive(Content v) => v.isActive;
  static const Field<Content, bool> _f$isActive =
      Field('isActive', _$isActive, key: 'is_active');
  static bool _$isDeleted(Content v) => v.isDeleted;
  static const Field<Content, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: 'is_deleted');
  static DateTime _$createdAt(Content v) => v.createdAt;
  static const Field<Content, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: 'created_at');
  static User _$createdBy(Content v) => v.createdBy;
  static const Field<Content, User> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by');
  static DateTime? _$updatedAt(Content v) => v.updatedAt;
  static const Field<Content, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: 'updated_at', opt: true);
  static User? _$updatedBy(Content v) => v.updatedBy;
  static const Field<Content, User> _f$updatedBy =
      Field('updatedBy', _$updatedBy, key: 'updated_by', opt: true);
  static List<User>? _$likes(Content v) => v.likes;
  static const Field<Content, List<User>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<User>? _$dislikes(Content v) => v.dislikes;
  static const Field<Content, List<User>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(Content v) => v.text;
  static const Field<Content, String> _f$text =
      Field('text', _$text, opt: true);
  static List<String>? _$media(Content v) => v.media;
  static const Field<Content, List<String>> _f$media =
      Field('media', _$media, opt: true);
  static String? _$city(Content v) => v.city;
  static const Field<Content, String> _f$city =
      Field('city', _$city, opt: true);
  static List<Comment>? _$comments(Content v) => v.comments;
  static const Field<Content, List<Comment>> _f$comments =
      Field('comments', _$comments, opt: true);
  static List<User>? _$linkedUsers(Content v) => v.linkedUsers;
  static const Field<Content, List<User>> _f$linkedUsers =
      Field('linkedUsers', _$linkedUsers, key: 'linked_users', opt: true);

  @override
  final MappableFields<Content> fields = const {
    #id: _f$id,
    #channels: _f$channels,
    #location: _f$location,
    #type: _f$type,
    #isActive: _f$isActive,
    #isDeleted: _f$isDeleted,
    #createdAt: _f$createdAt,
    #createdBy: _f$createdBy,
    #updatedAt: _f$updatedAt,
    #updatedBy: _f$updatedBy,
    #likes: _f$likes,
    #dislikes: _f$dislikes,
    #text: _f$text,
    #media: _f$media,
    #city: _f$city,
    #comments: _f$comments,
    #linkedUsers: _f$linkedUsers,
  };

  static Content _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Content');
  }

  @override
  final Function instantiate = _instantiate;

  static Content fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Content>(map);
  }

  static Content fromJson(String json) {
    return ensureInitialized().decodeJson<Content>(json);
  }
}

mixin ContentMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ContentCopyWith<Content, Content, Content> get copyWith;
}

abstract class ContentCopyWith<$R, $In extends Content, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Channel, ChannelCopyWith<$R, Channel, Channel>>?
      get channels;
  LocationCopyWith<$R, Location, Location> get location;
  UserCopyWith<$R, User, User> get createdBy;
  UserCopyWith<$R, User, User>? get updatedBy;
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get likes;
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get dislikes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>?>? get media;
  ListCopyWith<$R, Comment, CommentCopyWith<$R, Comment, Comment>>?
      get comments;
  $R call(
      {String? id,
      List<Channel>? channels,
      Location? location,
      ContentType? type,
      bool? isActive,
      bool? isDeleted,
      DateTime? createdAt,
      User? createdBy,
      DateTime? updatedAt,
      User? updatedBy,
      List<User>? likes,
      List<User>? dislikes,
      String? text,
      List<String>? media,
      String? city,
      List<Comment>? comments});
  ContentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class PostMapper extends ClassMapperBase<Post> {
  PostMapper._();

  static PostMapper? _instance;
  static PostMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostMapper._());
      ContentMapper.ensureInitialized();
      ChannelMapper.ensureInitialized();
      LocationMapper.ensureInitialized();
      UserMapper.ensureInitialized();
      CommentMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Post';

  static String _$id(Post v) => v.id;
  static const Field<Post, String> _f$id = Field('id', _$id);
  static List<Channel>? _$channels(Post v) => v.channels;
  static const Field<Post, List<Channel>> _f$channels =
      Field('channels', _$channels);
  static Location _$location(Post v) => v.location;
  static const Field<Post, Location> _f$location =
      Field('location', _$location);
  static ContentType _$type(Post v) => v.type;
  static const Field<Post, ContentType> _f$type = Field('type', _$type);
  static bool _$isActive(Post v) => v.isActive;
  static const Field<Post, bool> _f$isActive =
      Field('isActive', _$isActive, key: 'is_active');
  static bool _$isDeleted(Post v) => v.isDeleted;
  static const Field<Post, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: 'is_deleted');
  static DateTime _$createdAt(Post v) => v.createdAt;
  static const Field<Post, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: 'created_at');
  static User _$createdBy(Post v) => v.createdBy;
  static const Field<Post, User> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by');
  static DateTime? _$updatedAt(Post v) => v.updatedAt;
  static const Field<Post, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: 'updated_at', opt: true);
  static User? _$updatedBy(Post v) => v.updatedBy;
  static const Field<Post, User> _f$updatedBy =
      Field('updatedBy', _$updatedBy, key: 'updated_by', opt: true);
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
  static DateTime? _$endDate(Post v) => v.endDate;
  static const Field<Post, DateTime> _f$endDate =
      Field('endDate', _$endDate, key: 'end_date', opt: true);
  static List<User>? _$linkedUsers(Post v) => v.linkedUsers;
  static const Field<Post, List<User>> _f$linkedUsers =
      Field('linkedUsers', _$linkedUsers, key: 'linked_users');

  @override
  final MappableFields<Post> fields = const {
    #id: _f$id,
    #channels: _f$channels,
    #location: _f$location,
    #type: _f$type,
    #isActive: _f$isActive,
    #isDeleted: _f$isDeleted,
    #createdAt: _f$createdAt,
    #createdBy: _f$createdBy,
    #updatedAt: _f$updatedAt,
    #updatedBy: _f$updatedBy,
    #likes: _f$likes,
    #dislikes: _f$dislikes,
    #text: _f$text,
    #media: _f$media,
    #city: _f$city,
    #comments: _f$comments,
    #endDate: _f$endDate,
    #linkedUsers: _f$linkedUsers,
  };

  static Post _instantiate(DecodingData data) {
    return Post(
        id: data.dec(_f$id),
        channels: data.dec(_f$channels),
        location: data.dec(_f$location),
        type: data.dec(_f$type),
        isActive: data.dec(_f$isActive),
        isDeleted: data.dec(_f$isDeleted),
        createdAt: data.dec(_f$createdAt),
        createdBy: data.dec(_f$createdBy),
        updatedAt: data.dec(_f$updatedAt),
        updatedBy: data.dec(_f$updatedBy),
        likes: data.dec(_f$likes),
        dislikes: data.dec(_f$dislikes),
        text: data.dec(_f$text),
        media: data.dec(_f$media),
        city: data.dec(_f$city),
        comments: data.dec(_f$comments),
        endDate: data.dec(_f$endDate));
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
    implements ContentCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, Channel, ChannelCopyWith<$R, Channel, Channel>>?
      get channels;
  @override
  LocationCopyWith<$R, Location, Location> get location;
  @override
  UserCopyWith<$R, User, User> get createdBy;
  @override
  UserCopyWith<$R, User, User>? get updatedBy;
  @override
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get likes;
  @override
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get dislikes;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get media;
  @override
  ListCopyWith<$R, Comment, CommentCopyWith<$R, Comment, Comment>>?
      get comments;
  @override
  $R call(
      {String? id,
      List<Channel>? channels,
      Location? location,
      ContentType? type,
      bool? isActive,
      bool? isDeleted,
      DateTime? createdAt,
      User? createdBy,
      DateTime? updatedAt,
      User? updatedBy,
      List<User>? likes,
      List<User>? dislikes,
      String? text,
      List<String>? media,
      String? city,
      List<Comment>? comments,
      DateTime? endDate});
  PostCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Post, $Out>
    implements PostCopyWith<$R, Post, $Out> {
  _PostCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Post> $mapper = PostMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Channel, ChannelCopyWith<$R, Channel, Channel>>?
      get channels => $value.channels != null
          ? ListCopyWith($value.channels!, (v, t) => v.copyWith.$chain(t),
              (v) => call(channels: v))
          : null;
  @override
  LocationCopyWith<$R, Location, Location> get location =>
      $value.location.copyWith.$chain((v) => call(location: v));
  @override
  UserCopyWith<$R, User, User> get createdBy =>
      $value.createdBy.copyWith.$chain((v) => call(createdBy: v));
  @override
  UserCopyWith<$R, User, User>? get updatedBy =>
      $value.updatedBy?.copyWith.$chain((v) => call(updatedBy: v));
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
          Object? channels = $none,
          Location? location,
          ContentType? type,
          bool? isActive,
          bool? isDeleted,
          DateTime? createdAt,
          User? createdBy,
          Object? updatedAt = $none,
          Object? updatedBy = $none,
          Object? likes = $none,
          Object? dislikes = $none,
          Object? text = $none,
          Object? media = $none,
          Object? city = $none,
          Object? comments = $none,
          Object? endDate = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (channels != $none) #channels: channels,
        if (location != null) #location: location,
        if (type != null) #type: type,
        if (isActive != null) #isActive: isActive,
        if (isDeleted != null) #isDeleted: isDeleted,
        if (createdAt != null) #createdAt: createdAt,
        if (createdBy != null) #createdBy: createdBy,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (updatedBy != $none) #updatedBy: updatedBy,
        if (likes != $none) #likes: likes,
        if (dislikes != $none) #dislikes: dislikes,
        if (text != $none) #text: text,
        if (media != $none) #media: media,
        if (city != $none) #city: city,
        if (comments != $none) #comments: comments,
        if (endDate != $none) #endDate: endDate
      }));
  @override
  Post $make(CopyWithData data) => Post(
      id: data.get(#id, or: $value.id),
      channels: data.get(#channels, or: $value.channels),
      location: data.get(#location, or: $value.location),
      type: data.get(#type, or: $value.type),
      isActive: data.get(#isActive, or: $value.isActive),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      updatedBy: data.get(#updatedBy, or: $value.updatedBy),
      likes: data.get(#likes, or: $value.likes),
      dislikes: data.get(#dislikes, or: $value.dislikes),
      text: data.get(#text, or: $value.text),
      media: data.get(#media, or: $value.media),
      city: data.get(#city, or: $value.city),
      comments: data.get(#comments, or: $value.comments),
      endDate: data.get(#endDate, or: $value.endDate));

  @override
  PostCopyWith<$R2, Post, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PostCopyWithImpl($value, $cast, t);
}

class StoryMapper extends ClassMapperBase<Story> {
  StoryMapper._();

  static StoryMapper? _instance;
  static StoryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StoryMapper._());
      ContentMapper.ensureInitialized();
      ChannelMapper.ensureInitialized();
      LocationMapper.ensureInitialized();
      UserMapper.ensureInitialized();
      CommentMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Story';

  static String _$id(Story v) => v.id;
  static const Field<Story, String> _f$id = Field('id', _$id);
  static List<Channel>? _$channels(Story v) => v.channels;
  static const Field<Story, List<Channel>> _f$channels =
      Field('channels', _$channels);
  static Location _$location(Story v) => v.location;
  static const Field<Story, Location> _f$location =
      Field('location', _$location);
  static ContentType _$type(Story v) => v.type;
  static const Field<Story, ContentType> _f$type = Field('type', _$type);
  static bool _$isActive(Story v) => v.isActive;
  static const Field<Story, bool> _f$isActive =
      Field('isActive', _$isActive, key: 'is_active');
  static bool _$isDeleted(Story v) => v.isDeleted;
  static const Field<Story, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: 'is_deleted');
  static DateTime _$createdAt(Story v) => v.createdAt;
  static const Field<Story, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: 'created_at');
  static User _$createdBy(Story v) => v.createdBy;
  static const Field<Story, User> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by');
  static DateTime? _$updatedAt(Story v) => v.updatedAt;
  static const Field<Story, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: 'updated_at', opt: true);
  static User? _$updatedBy(Story v) => v.updatedBy;
  static const Field<Story, User> _f$updatedBy =
      Field('updatedBy', _$updatedBy, key: 'updated_by', opt: true);
  static List<User>? _$likes(Story v) => v.likes;
  static const Field<Story, List<User>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<User>? _$dislikes(Story v) => v.dislikes;
  static const Field<Story, List<User>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(Story v) => v.text;
  static const Field<Story, String> _f$text = Field('text', _$text, opt: true);
  static List<String>? _$media(Story v) => v.media;
  static const Field<Story, List<String>> _f$media =
      Field('media', _$media, opt: true);
  static String? _$city(Story v) => v.city;
  static const Field<Story, String> _f$city = Field('city', _$city, opt: true);
  static List<Comment>? _$comments(Story v) => v.comments;
  static const Field<Story, List<Comment>> _f$comments =
      Field('comments', _$comments, opt: true);
  static List<User>? _$linkedUsers(Story v) => v.linkedUsers;
  static const Field<Story, List<User>> _f$linkedUsers =
      Field('linkedUsers', _$linkedUsers, key: 'linked_users');

  @override
  final MappableFields<Story> fields = const {
    #id: _f$id,
    #channels: _f$channels,
    #location: _f$location,
    #type: _f$type,
    #isActive: _f$isActive,
    #isDeleted: _f$isDeleted,
    #createdAt: _f$createdAt,
    #createdBy: _f$createdBy,
    #updatedAt: _f$updatedAt,
    #updatedBy: _f$updatedBy,
    #likes: _f$likes,
    #dislikes: _f$dislikes,
    #text: _f$text,
    #media: _f$media,
    #city: _f$city,
    #comments: _f$comments,
    #linkedUsers: _f$linkedUsers,
  };

  static Story _instantiate(DecodingData data) {
    return Story(
        id: data.dec(_f$id),
        channels: data.dec(_f$channels),
        location: data.dec(_f$location),
        type: data.dec(_f$type),
        isActive: data.dec(_f$isActive),
        isDeleted: data.dec(_f$isDeleted),
        createdAt: data.dec(_f$createdAt),
        createdBy: data.dec(_f$createdBy),
        updatedAt: data.dec(_f$updatedAt),
        updatedBy: data.dec(_f$updatedBy),
        likes: data.dec(_f$likes),
        dislikes: data.dec(_f$dislikes),
        text: data.dec(_f$text),
        media: data.dec(_f$media),
        city: data.dec(_f$city),
        comments: data.dec(_f$comments));
  }

  @override
  final Function instantiate = _instantiate;

  static Story fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Story>(map);
  }

  static Story fromJson(String json) {
    return ensureInitialized().decodeJson<Story>(json);
  }
}

mixin StoryMappable {
  String toJson() {
    return StoryMapper.ensureInitialized().encodeJson<Story>(this as Story);
  }

  Map<String, dynamic> toMap() {
    return StoryMapper.ensureInitialized().encodeMap<Story>(this as Story);
  }

  StoryCopyWith<Story, Story, Story> get copyWith =>
      _StoryCopyWithImpl(this as Story, $identity, $identity);
  @override
  String toString() {
    return StoryMapper.ensureInitialized().stringifyValue(this as Story);
  }

  @override
  bool operator ==(Object other) {
    return StoryMapper.ensureInitialized().equalsValue(this as Story, other);
  }

  @override
  int get hashCode {
    return StoryMapper.ensureInitialized().hashValue(this as Story);
  }
}

extension StoryValueCopy<$R, $Out> on ObjectCopyWith<$R, Story, $Out> {
  StoryCopyWith<$R, Story, $Out> get $asStory =>
      $base.as((v, t, t2) => _StoryCopyWithImpl(v, t, t2));
}

abstract class StoryCopyWith<$R, $In extends Story, $Out>
    implements ContentCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, Channel, ChannelCopyWith<$R, Channel, Channel>>?
      get channels;
  @override
  LocationCopyWith<$R, Location, Location> get location;
  @override
  UserCopyWith<$R, User, User> get createdBy;
  @override
  UserCopyWith<$R, User, User>? get updatedBy;
  @override
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get likes;
  @override
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get dislikes;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get media;
  @override
  ListCopyWith<$R, Comment, CommentCopyWith<$R, Comment, Comment>>?
      get comments;
  @override
  $R call(
      {String? id,
      List<Channel>? channels,
      Location? location,
      ContentType? type,
      bool? isActive,
      bool? isDeleted,
      DateTime? createdAt,
      User? createdBy,
      DateTime? updatedAt,
      User? updatedBy,
      List<User>? likes,
      List<User>? dislikes,
      String? text,
      List<String>? media,
      String? city,
      List<Comment>? comments});
  StoryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StoryCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Story, $Out>
    implements StoryCopyWith<$R, Story, $Out> {
  _StoryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Story> $mapper = StoryMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Channel, ChannelCopyWith<$R, Channel, Channel>>?
      get channels => $value.channels != null
          ? ListCopyWith($value.channels!, (v, t) => v.copyWith.$chain(t),
              (v) => call(channels: v))
          : null;
  @override
  LocationCopyWith<$R, Location, Location> get location =>
      $value.location.copyWith.$chain((v) => call(location: v));
  @override
  UserCopyWith<$R, User, User> get createdBy =>
      $value.createdBy.copyWith.$chain((v) => call(createdBy: v));
  @override
  UserCopyWith<$R, User, User>? get updatedBy =>
      $value.updatedBy?.copyWith.$chain((v) => call(updatedBy: v));
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
          Object? channels = $none,
          Location? location,
          ContentType? type,
          bool? isActive,
          bool? isDeleted,
          DateTime? createdAt,
          User? createdBy,
          Object? updatedAt = $none,
          Object? updatedBy = $none,
          Object? likes = $none,
          Object? dislikes = $none,
          Object? text = $none,
          Object? media = $none,
          Object? city = $none,
          Object? comments = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (channels != $none) #channels: channels,
        if (location != null) #location: location,
        if (type != null) #type: type,
        if (isActive != null) #isActive: isActive,
        if (isDeleted != null) #isDeleted: isDeleted,
        if (createdAt != null) #createdAt: createdAt,
        if (createdBy != null) #createdBy: createdBy,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (updatedBy != $none) #updatedBy: updatedBy,
        if (likes != $none) #likes: likes,
        if (dislikes != $none) #dislikes: dislikes,
        if (text != $none) #text: text,
        if (media != $none) #media: media,
        if (city != $none) #city: city,
        if (comments != $none) #comments: comments
      }));
  @override
  Story $make(CopyWithData data) => Story(
      id: data.get(#id, or: $value.id),
      channels: data.get(#channels, or: $value.channels),
      location: data.get(#location, or: $value.location),
      type: data.get(#type, or: $value.type),
      isActive: data.get(#isActive, or: $value.isActive),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      updatedBy: data.get(#updatedBy, or: $value.updatedBy),
      likes: data.get(#likes, or: $value.likes),
      dislikes: data.get(#dislikes, or: $value.dislikes),
      text: data.get(#text, or: $value.text),
      media: data.get(#media, or: $value.media),
      city: data.get(#city, or: $value.city),
      comments: data.get(#comments, or: $value.comments));

  @override
  StoryCopyWith<$R2, Story, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _StoryCopyWithImpl($value, $cast, t);
}
