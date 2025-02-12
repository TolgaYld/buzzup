// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post.model.dart';

class PostModelMapper extends ClassMapperBase<PostModel> {
  PostModelMapper._();

  static PostModelMapper? _instance;
  static PostModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostModelMapper._());
      PostEntityMapper.ensureInitialized();
      ChannelEntityMapper.ensureInitialized();
      LocationEntityMapper.ensureInitialized();
      ContentVisibilityMapper.ensureInitialized();
      UserEntityMapper.ensureInitialized();
      CommentEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PostModel';

  static String _$id(PostModel v) => v.id;
  static const Field<PostModel, String> _f$id = Field('id', _$id, key: r'_id');
  static List<ChannelEntity> _$channels(PostModel v) => v.channels;
  static const Field<PostModel, List<ChannelEntity>> _f$channels =
      Field('channels', _$channels);
  static LocationEntity _$location(PostModel v) => v.location;
  static const Field<PostModel, LocationEntity> _f$location =
      Field('location', _$location);
  static ContentVisibility _$visibility(PostModel v) => v.visibility;
  static const Field<PostModel, ContentVisibility> _f$visibility =
      Field('visibility', _$visibility);
  static bool _$isActive(PostModel v) => v.isActive;
  static const Field<PostModel, bool> _f$isActive =
      Field('isActive', _$isActive, key: r'is_active');
  static bool _$isDeleted(PostModel v) => v.isDeleted;
  static const Field<PostModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: r'is_deleted');
  static DateTime _$createdAt(PostModel v) => v.createdAt;
  static const Field<PostModel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static UserEntity _$createdBy(PostModel v) => v.createdBy;
  static const Field<PostModel, UserEntity> _f$createdBy =
      Field('createdBy', _$createdBy, key: r'created_by');
  static DateTime? _$updatedAt(PostModel v) => v.updatedAt;
  static const Field<PostModel, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: r'updated_at', opt: true);
  static UserEntity? _$updatedBy(PostModel v) => v.updatedBy;
  static const Field<PostModel, UserEntity> _f$updatedBy =
      Field('updatedBy', _$updatedBy, key: r'updated_by', opt: true);
  static List<UserEntity>? _$likes(PostModel v) => v.likes;
  static const Field<PostModel, List<UserEntity>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<UserEntity>? _$dislikes(PostModel v) => v.dislikes;
  static const Field<PostModel, List<UserEntity>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(PostModel v) => v.text;
  static const Field<PostModel, String> _f$text =
      Field('text', _$text, opt: true);
  static List<String>? _$media(PostModel v) => v.media;
  static const Field<PostModel, List<String>> _f$media =
      Field('media', _$media, opt: true);
  static String? _$city(PostModel v) => v.city;
  static const Field<PostModel, String> _f$city =
      Field('city', _$city, opt: true);
  static List<CommentEntity>? _$comments(PostModel v) => v.comments;
  static const Field<PostModel, List<CommentEntity>> _f$comments =
      Field('comments', _$comments, opt: true);
  static DateTime? _$endDate(PostModel v) => v.endDate;
  static const Field<PostModel, DateTime> _f$endDate =
      Field('endDate', _$endDate, key: r'end_date', opt: true);
  static List<UserEntity>? _$linkedUsers(PostModel v) => v.linkedUsers;
  static const Field<PostModel, List<UserEntity>> _f$linkedUsers =
      Field('linkedUsers', _$linkedUsers, mode: FieldMode.member);

  @override
  final MappableFields<PostModel> fields = const {
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

  static PostModel _instantiate(DecodingData data) {
    return PostModel(
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

  static PostModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PostModel>(map);
  }

  static PostModel fromJson(String json) {
    return ensureInitialized().decodeJson<PostModel>(json);
  }
}

mixin PostModelMappable {
  String toJson() {
    return PostModelMapper.ensureInitialized()
        .encodeJson<PostModel>(this as PostModel);
  }

  Map<String, dynamic> toMap() {
    return PostModelMapper.ensureInitialized()
        .encodeMap<PostModel>(this as PostModel);
  }

  PostModelCopyWith<PostModel, PostModel, PostModel> get copyWith =>
      _PostModelCopyWithImpl(this as PostModel, $identity, $identity);
  @override
  String toString() {
    return PostModelMapper.ensureInitialized()
        .stringifyValue(this as PostModel);
  }

  @override
  bool operator ==(Object other) {
    return PostModelMapper.ensureInitialized()
        .equalsValue(this as PostModel, other);
  }

  @override
  int get hashCode {
    return PostModelMapper.ensureInitialized().hashValue(this as PostModel);
  }
}

extension PostModelValueCopy<$R, $Out> on ObjectCopyWith<$R, PostModel, $Out> {
  PostModelCopyWith<$R, PostModel, $Out> get $asPostModel =>
      $base.as((v, t, t2) => _PostModelCopyWithImpl(v, t, t2));
}

abstract class PostModelCopyWith<$R, $In extends PostModel, $Out>
    implements PostEntityCopyWith<$R, $In, $Out> {
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
  PostModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PostModel, $Out>
    implements PostModelCopyWith<$R, PostModel, $Out> {
  _PostModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PostModel> $mapper =
      PostModelMapper.ensureInitialized();
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
  PostModel $make(CopyWithData data) => PostModel(
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
  PostModelCopyWith<$R2, PostModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PostModelCopyWithImpl($value, $cast, t);
}
