// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'content.entity.dart';

class ContentEntityMapper extends ClassMapperBase<ContentEntity> {
  ContentEntityMapper._();

  static ContentEntityMapper? _instance;
  static ContentEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContentEntityMapper._());
      PostEntityMapper.ensureInitialized();
      StoryEntityMapper.ensureInitialized();
      ChannelEntityMapper.ensureInitialized();
      LocationEntityMapper.ensureInitialized();
      ContentVisibilityMapper.ensureInitialized();
      UserEntityMapper.ensureInitialized();
      CommentEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ContentEntity';

  static String _$id(ContentEntity v) => v.id;
  static const Field<ContentEntity, String> _f$id = Field('id', _$id);
  static List<ChannelEntity> _$channels(ContentEntity v) => v.channels;
  static const Field<ContentEntity, List<ChannelEntity>> _f$channels =
      Field('channels', _$channels);
  static LocationEntity _$location(ContentEntity v) => v.location;
  static const Field<ContentEntity, LocationEntity> _f$location =
      Field('location', _$location);
  static ContentVisibility _$visibility(ContentEntity v) => v.visibility;
  static const Field<ContentEntity, ContentVisibility> _f$visibility =
      Field('visibility', _$visibility);
  static bool _$isActive(ContentEntity v) => v.isActive;
  static const Field<ContentEntity, bool> _f$isActive =
      Field('isActive', _$isActive);
  static bool _$isDeleted(ContentEntity v) => v.isDeleted;
  static const Field<ContentEntity, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted);
  static DateTime _$createdAt(ContentEntity v) => v.createdAt;
  static const Field<ContentEntity, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static UserEntity _$createdBy(ContentEntity v) => v.createdBy;
  static const Field<ContentEntity, UserEntity> _f$createdBy =
      Field('createdBy', _$createdBy);
  static DateTime? _$updatedAt(ContentEntity v) => v.updatedAt;
  static const Field<ContentEntity, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static UserEntity? _$updatedBy(ContentEntity v) => v.updatedBy;
  static const Field<ContentEntity, UserEntity> _f$updatedBy =
      Field('updatedBy', _$updatedBy, opt: true);
  static List<UserEntity>? _$likes(ContentEntity v) => v.likes;
  static const Field<ContentEntity, List<UserEntity>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<UserEntity>? _$dislikes(ContentEntity v) => v.dislikes;
  static const Field<ContentEntity, List<UserEntity>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(ContentEntity v) => v.text;
  static const Field<ContentEntity, String> _f$text =
      Field('text', _$text, opt: true);
  static List<String>? _$media(ContentEntity v) => v.media;
  static const Field<ContentEntity, List<String>> _f$media =
      Field('media', _$media, opt: true);
  static String? _$city(ContentEntity v) => v.city;
  static const Field<ContentEntity, String> _f$city =
      Field('city', _$city, opt: true);
  static List<CommentEntity>? _$comments(ContentEntity v) => v.comments;
  static const Field<ContentEntity, List<CommentEntity>> _f$comments =
      Field('comments', _$comments, opt: true);
  static List<UserEntity>? _$linkedUsers(ContentEntity v) => v.linkedUsers;
  static const Field<ContentEntity, List<UserEntity>> _f$linkedUsers =
      Field('linkedUsers', _$linkedUsers, opt: true);

  @override
  final MappableFields<ContentEntity> fields = const {
    #id: _f$id,
    #channels: _f$channels,
    #location: _f$location,
    #visibility: _f$visibility,
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

  static ContentEntity _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('ContentEntity');
  }

  @override
  final Function instantiate = _instantiate;

  static ContentEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ContentEntity>(map);
  }

  static ContentEntity fromJson(String json) {
    return ensureInitialized().decodeJson<ContentEntity>(json);
  }
}

mixin ContentEntityMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ContentEntityCopyWith<ContentEntity, ContentEntity, ContentEntity>
      get copyWith;
}

abstract class ContentEntityCopyWith<$R, $In extends ContentEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, ChannelEntity,
      ChannelEntityCopyWith<$R, ChannelEntity, ChannelEntity>> get channels;
  LocationEntityCopyWith<$R, LocationEntity, LocationEntity> get location;
  UserEntityCopyWith<$R, UserEntity, UserEntity> get createdBy;
  UserEntityCopyWith<$R, UserEntity, UserEntity>? get updatedBy;
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get likes;
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get dislikes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>?>? get media;
  ListCopyWith<$R, CommentEntity,
      CommentEntityCopyWith<$R, CommentEntity, CommentEntity>>? get comments;
  $R call(
      {String? id,
      List<ChannelEntity>? channels,
      LocationEntity? location,
      ContentVisibility? visibility,
      bool? isActive,
      bool? isDeleted,
      DateTime? createdAt,
      UserEntity? createdBy,
      DateTime? updatedAt,
      UserEntity? updatedBy,
      List<UserEntity>? likes,
      List<UserEntity>? dislikes,
      String? text,
      List<String>? media,
      String? city,
      List<CommentEntity>? comments});
  ContentEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class PostEntityMapper extends ClassMapperBase<PostEntity> {
  PostEntityMapper._();

  static PostEntityMapper? _instance;
  static PostEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostEntityMapper._());
      ContentEntityMapper.ensureInitialized();
      ChannelEntityMapper.ensureInitialized();
      LocationEntityMapper.ensureInitialized();
      ContentVisibilityMapper.ensureInitialized();
      UserEntityMapper.ensureInitialized();
      CommentEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PostEntity';

  static String _$id(PostEntity v) => v.id;
  static const Field<PostEntity, String> _f$id = Field('id', _$id);
  static List<ChannelEntity> _$channels(PostEntity v) => v.channels;
  static const Field<PostEntity, List<ChannelEntity>> _f$channels =
      Field('channels', _$channels);
  static LocationEntity _$location(PostEntity v) => v.location;
  static const Field<PostEntity, LocationEntity> _f$location =
      Field('location', _$location);
  static ContentVisibility _$visibility(PostEntity v) => v.visibility;
  static const Field<PostEntity, ContentVisibility> _f$visibility =
      Field('visibility', _$visibility);
  static bool _$isActive(PostEntity v) => v.isActive;
  static const Field<PostEntity, bool> _f$isActive =
      Field('isActive', _$isActive);
  static bool _$isDeleted(PostEntity v) => v.isDeleted;
  static const Field<PostEntity, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted);
  static DateTime _$createdAt(PostEntity v) => v.createdAt;
  static const Field<PostEntity, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static UserEntity _$createdBy(PostEntity v) => v.createdBy;
  static const Field<PostEntity, UserEntity> _f$createdBy =
      Field('createdBy', _$createdBy);
  static DateTime? _$updatedAt(PostEntity v) => v.updatedAt;
  static const Field<PostEntity, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static UserEntity? _$updatedBy(PostEntity v) => v.updatedBy;
  static const Field<PostEntity, UserEntity> _f$updatedBy =
      Field('updatedBy', _$updatedBy, opt: true);
  static List<UserEntity>? _$likes(PostEntity v) => v.likes;
  static const Field<PostEntity, List<UserEntity>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<UserEntity>? _$dislikes(PostEntity v) => v.dislikes;
  static const Field<PostEntity, List<UserEntity>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(PostEntity v) => v.text;
  static const Field<PostEntity, String> _f$text =
      Field('text', _$text, opt: true);
  static List<String>? _$media(PostEntity v) => v.media;
  static const Field<PostEntity, List<String>> _f$media =
      Field('media', _$media, opt: true);
  static String? _$city(PostEntity v) => v.city;
  static const Field<PostEntity, String> _f$city =
      Field('city', _$city, opt: true);
  static List<CommentEntity>? _$comments(PostEntity v) => v.comments;
  static const Field<PostEntity, List<CommentEntity>> _f$comments =
      Field('comments', _$comments, opt: true);
  static DateTime? _$endDate(PostEntity v) => v.endDate;
  static const Field<PostEntity, DateTime> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static List<UserEntity>? _$linkedUsers(PostEntity v) => v.linkedUsers;
  static const Field<PostEntity, List<UserEntity>> _f$linkedUsers =
      Field('linkedUsers', _$linkedUsers, mode: FieldMode.member);

  @override
  final MappableFields<PostEntity> fields = const {
    #id: _f$id,
    #channels: _f$channels,
    #location: _f$location,
    #visibility: _f$visibility,
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

  static PostEntity _instantiate(DecodingData data) {
    return PostEntity(
        id: data.dec(_f$id),
        channels: data.dec(_f$channels),
        location: data.dec(_f$location),
        visibility: data.dec(_f$visibility),
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

  static PostEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PostEntity>(map);
  }

  static PostEntity fromJson(String json) {
    return ensureInitialized().decodeJson<PostEntity>(json);
  }
}

mixin PostEntityMappable {
  String toJson() {
    return PostEntityMapper.ensureInitialized()
        .encodeJson<PostEntity>(this as PostEntity);
  }

  Map<String, dynamic> toMap() {
    return PostEntityMapper.ensureInitialized()
        .encodeMap<PostEntity>(this as PostEntity);
  }

  PostEntityCopyWith<PostEntity, PostEntity, PostEntity> get copyWith =>
      _PostEntityCopyWithImpl(this as PostEntity, $identity, $identity);
  @override
  String toString() {
    return PostEntityMapper.ensureInitialized()
        .stringifyValue(this as PostEntity);
  }

  @override
  bool operator ==(Object other) {
    return PostEntityMapper.ensureInitialized()
        .equalsValue(this as PostEntity, other);
  }

  @override
  int get hashCode {
    return PostEntityMapper.ensureInitialized().hashValue(this as PostEntity);
  }
}

extension PostEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PostEntity, $Out> {
  PostEntityCopyWith<$R, PostEntity, $Out> get $asPostEntity =>
      $base.as((v, t, t2) => _PostEntityCopyWithImpl(v, t, t2));
}

abstract class PostEntityCopyWith<$R, $In extends PostEntity, $Out>
    implements ContentEntityCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, ChannelEntity,
      ChannelEntityCopyWith<$R, ChannelEntity, ChannelEntity>> get channels;
  @override
  LocationEntityCopyWith<$R, LocationEntity, LocationEntity> get location;
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity> get createdBy;
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity>? get updatedBy;
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get likes;
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get dislikes;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get media;
  @override
  ListCopyWith<$R, CommentEntity,
      CommentEntityCopyWith<$R, CommentEntity, CommentEntity>>? get comments;
  @override
  $R call(
      {String? id,
      List<ChannelEntity>? channels,
      LocationEntity? location,
      ContentVisibility? visibility,
      bool? isActive,
      bool? isDeleted,
      DateTime? createdAt,
      UserEntity? createdBy,
      DateTime? updatedAt,
      UserEntity? updatedBy,
      List<UserEntity>? likes,
      List<UserEntity>? dislikes,
      String? text,
      List<String>? media,
      String? city,
      List<CommentEntity>? comments,
      DateTime? endDate});
  PostEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PostEntity, $Out>
    implements PostEntityCopyWith<$R, PostEntity, $Out> {
  _PostEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PostEntity> $mapper =
      PostEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, ChannelEntity,
          ChannelEntityCopyWith<$R, ChannelEntity, ChannelEntity>>
      get channels => ListCopyWith($value.channels,
          (v, t) => v.copyWith.$chain(t), (v) => call(channels: v));
  @override
  LocationEntityCopyWith<$R, LocationEntity, LocationEntity> get location =>
      $value.location.copyWith.$chain((v) => call(location: v));
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity> get createdBy =>
      $value.createdBy.copyWith.$chain((v) => call(createdBy: v));
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity>? get updatedBy =>
      $value.updatedBy?.copyWith.$chain((v) => call(updatedBy: v));
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get likes => $value.likes != null
          ? ListCopyWith($value.likes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(likes: v))
          : null;
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get dislikes => $value.dislikes != null
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
  ListCopyWith<$R, CommentEntity,
          CommentEntityCopyWith<$R, CommentEntity, CommentEntity>>?
      get comments => $value.comments != null
          ? ListCopyWith($value.comments!, (v, t) => v.copyWith.$chain(t),
              (v) => call(comments: v))
          : null;
  @override
  $R call(
          {String? id,
          List<ChannelEntity>? channels,
          LocationEntity? location,
          ContentVisibility? visibility,
          bool? isActive,
          bool? isDeleted,
          DateTime? createdAt,
          UserEntity? createdBy,
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
        if (channels != null) #channels: channels,
        if (location != null) #location: location,
        if (visibility != null) #visibility: visibility,
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
  PostEntity $make(CopyWithData data) => PostEntity(
      id: data.get(#id, or: $value.id),
      channels: data.get(#channels, or: $value.channels),
      location: data.get(#location, or: $value.location),
      visibility: data.get(#visibility, or: $value.visibility),
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
  PostEntityCopyWith<$R2, PostEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PostEntityCopyWithImpl($value, $cast, t);
}

class StoryEntityMapper extends ClassMapperBase<StoryEntity> {
  StoryEntityMapper._();

  static StoryEntityMapper? _instance;
  static StoryEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StoryEntityMapper._());
      ContentEntityMapper.ensureInitialized();
      ChannelEntityMapper.ensureInitialized();
      LocationEntityMapper.ensureInitialized();
      ContentVisibilityMapper.ensureInitialized();
      UserEntityMapper.ensureInitialized();
      CommentEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StoryEntity';

  static String _$id(StoryEntity v) => v.id;
  static const Field<StoryEntity, String> _f$id = Field('id', _$id);
  static List<ChannelEntity> _$channels(StoryEntity v) => v.channels;
  static const Field<StoryEntity, List<ChannelEntity>> _f$channels =
      Field('channels', _$channels);
  static LocationEntity _$location(StoryEntity v) => v.location;
  static const Field<StoryEntity, LocationEntity> _f$location =
      Field('location', _$location);
  static ContentVisibility _$visibility(StoryEntity v) => v.visibility;
  static const Field<StoryEntity, ContentVisibility> _f$visibility =
      Field('visibility', _$visibility);
  static bool _$isActive(StoryEntity v) => v.isActive;
  static const Field<StoryEntity, bool> _f$isActive =
      Field('isActive', _$isActive);
  static bool _$isDeleted(StoryEntity v) => v.isDeleted;
  static const Field<StoryEntity, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted);
  static DateTime _$createdAt(StoryEntity v) => v.createdAt;
  static const Field<StoryEntity, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static UserEntity _$createdBy(StoryEntity v) => v.createdBy;
  static const Field<StoryEntity, UserEntity> _f$createdBy =
      Field('createdBy', _$createdBy);
  static DateTime? _$updatedAt(StoryEntity v) => v.updatedAt;
  static const Field<StoryEntity, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static UserEntity? _$updatedBy(StoryEntity v) => v.updatedBy;
  static const Field<StoryEntity, UserEntity> _f$updatedBy =
      Field('updatedBy', _$updatedBy, opt: true);
  static List<UserEntity>? _$likes(StoryEntity v) => v.likes;
  static const Field<StoryEntity, List<UserEntity>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<UserEntity>? _$dislikes(StoryEntity v) => v.dislikes;
  static const Field<StoryEntity, List<UserEntity>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(StoryEntity v) => v.text;
  static const Field<StoryEntity, String> _f$text =
      Field('text', _$text, opt: true);
  static List<String>? _$media(StoryEntity v) => v.media;
  static const Field<StoryEntity, List<String>> _f$media =
      Field('media', _$media, opt: true);
  static String? _$city(StoryEntity v) => v.city;
  static const Field<StoryEntity, String> _f$city =
      Field('city', _$city, opt: true);
  static List<CommentEntity>? _$comments(StoryEntity v) => v.comments;
  static const Field<StoryEntity, List<CommentEntity>> _f$comments =
      Field('comments', _$comments, opt: true);
  static List<UserEntity>? _$linkedUsers(StoryEntity v) => v.linkedUsers;
  static const Field<StoryEntity, List<UserEntity>> _f$linkedUsers =
      Field('linkedUsers', _$linkedUsers, mode: FieldMode.member);

  @override
  final MappableFields<StoryEntity> fields = const {
    #id: _f$id,
    #channels: _f$channels,
    #location: _f$location,
    #visibility: _f$visibility,
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

  static StoryEntity _instantiate(DecodingData data) {
    return StoryEntity(
        id: data.dec(_f$id),
        channels: data.dec(_f$channels),
        location: data.dec(_f$location),
        visibility: data.dec(_f$visibility),
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

  static StoryEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StoryEntity>(map);
  }

  static StoryEntity fromJson(String json) {
    return ensureInitialized().decodeJson<StoryEntity>(json);
  }
}

mixin StoryEntityMappable {
  String toJson() {
    return StoryEntityMapper.ensureInitialized()
        .encodeJson<StoryEntity>(this as StoryEntity);
  }

  Map<String, dynamic> toMap() {
    return StoryEntityMapper.ensureInitialized()
        .encodeMap<StoryEntity>(this as StoryEntity);
  }

  StoryEntityCopyWith<StoryEntity, StoryEntity, StoryEntity> get copyWith =>
      _StoryEntityCopyWithImpl(this as StoryEntity, $identity, $identity);
  @override
  String toString() {
    return StoryEntityMapper.ensureInitialized()
        .stringifyValue(this as StoryEntity);
  }

  @override
  bool operator ==(Object other) {
    return StoryEntityMapper.ensureInitialized()
        .equalsValue(this as StoryEntity, other);
  }

  @override
  int get hashCode {
    return StoryEntityMapper.ensureInitialized().hashValue(this as StoryEntity);
  }
}

extension StoryEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StoryEntity, $Out> {
  StoryEntityCopyWith<$R, StoryEntity, $Out> get $asStoryEntity =>
      $base.as((v, t, t2) => _StoryEntityCopyWithImpl(v, t, t2));
}

abstract class StoryEntityCopyWith<$R, $In extends StoryEntity, $Out>
    implements ContentEntityCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, ChannelEntity,
      ChannelEntityCopyWith<$R, ChannelEntity, ChannelEntity>> get channels;
  @override
  LocationEntityCopyWith<$R, LocationEntity, LocationEntity> get location;
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity> get createdBy;
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity>? get updatedBy;
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get likes;
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get dislikes;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get media;
  @override
  ListCopyWith<$R, CommentEntity,
      CommentEntityCopyWith<$R, CommentEntity, CommentEntity>>? get comments;
  @override
  $R call(
      {String? id,
      List<ChannelEntity>? channels,
      LocationEntity? location,
      ContentVisibility? visibility,
      bool? isActive,
      bool? isDeleted,
      DateTime? createdAt,
      UserEntity? createdBy,
      DateTime? updatedAt,
      UserEntity? updatedBy,
      List<UserEntity>? likes,
      List<UserEntity>? dislikes,
      String? text,
      List<String>? media,
      String? city,
      List<CommentEntity>? comments});
  StoryEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StoryEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StoryEntity, $Out>
    implements StoryEntityCopyWith<$R, StoryEntity, $Out> {
  _StoryEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StoryEntity> $mapper =
      StoryEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, ChannelEntity,
          ChannelEntityCopyWith<$R, ChannelEntity, ChannelEntity>>
      get channels => ListCopyWith($value.channels,
          (v, t) => v.copyWith.$chain(t), (v) => call(channels: v));
  @override
  LocationEntityCopyWith<$R, LocationEntity, LocationEntity> get location =>
      $value.location.copyWith.$chain((v) => call(location: v));
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity> get createdBy =>
      $value.createdBy.copyWith.$chain((v) => call(createdBy: v));
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity>? get updatedBy =>
      $value.updatedBy?.copyWith.$chain((v) => call(updatedBy: v));
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get likes => $value.likes != null
          ? ListCopyWith($value.likes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(likes: v))
          : null;
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get dislikes => $value.dislikes != null
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
  ListCopyWith<$R, CommentEntity,
          CommentEntityCopyWith<$R, CommentEntity, CommentEntity>>?
      get comments => $value.comments != null
          ? ListCopyWith($value.comments!, (v, t) => v.copyWith.$chain(t),
              (v) => call(comments: v))
          : null;
  @override
  $R call(
          {String? id,
          List<ChannelEntity>? channels,
          LocationEntity? location,
          ContentVisibility? visibility,
          bool? isActive,
          bool? isDeleted,
          DateTime? createdAt,
          UserEntity? createdBy,
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
        if (channels != null) #channels: channels,
        if (location != null) #location: location,
        if (visibility != null) #visibility: visibility,
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
  StoryEntity $make(CopyWithData data) => StoryEntity(
      id: data.get(#id, or: $value.id),
      channels: data.get(#channels, or: $value.channels),
      location: data.get(#location, or: $value.location),
      visibility: data.get(#visibility, or: $value.visibility),
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
  StoryEntityCopyWith<$R2, StoryEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StoryEntityCopyWithImpl($value, $cast, t);
}
