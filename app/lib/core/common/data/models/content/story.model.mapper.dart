// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'story.model.dart';

class StoryModelMapper extends ClassMapperBase<StoryModel> {
  StoryModelMapper._();

  static StoryModelMapper? _instance;
  static StoryModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StoryModelMapper._());
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
  final String id = 'StoryModel';

  static String _$id(StoryModel v) => v.id;
  static const Field<StoryModel, String> _f$id = Field('id', _$id, key: r'_id');
  static List<ChannelEntity> _$channels(StoryModel v) => v.channels;
  static const Field<StoryModel, List<ChannelEntity>> _f$channels =
      Field('channels', _$channels);
  static LocationEntity _$location(StoryModel v) => v.location;
  static const Field<StoryModel, LocationEntity> _f$location =
      Field('location', _$location);
  static ContentVisibility _$visibility(StoryModel v) => v.visibility;
  static const Field<StoryModel, ContentVisibility> _f$visibility =
      Field('visibility', _$visibility);
  static bool _$isActive(StoryModel v) => v.isActive;
  static const Field<StoryModel, bool> _f$isActive =
      Field('isActive', _$isActive, key: r'is_active');
  static bool _$isDeleted(StoryModel v) => v.isDeleted;
  static const Field<StoryModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: r'is_deleted');
  static DateTime _$createdAt(StoryModel v) => v.createdAt;
  static const Field<StoryModel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static UserEntity _$createdBy(StoryModel v) => v.createdBy;
  static const Field<StoryModel, UserEntity> _f$createdBy =
      Field('createdBy', _$createdBy, key: r'created_by');
  static DateTime? _$updatedAt(StoryModel v) => v.updatedAt;
  static const Field<StoryModel, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: r'updated_at', opt: true);
  static UserEntity? _$updatedBy(StoryModel v) => v.updatedBy;
  static const Field<StoryModel, UserEntity> _f$updatedBy =
      Field('updatedBy', _$updatedBy, key: r'updated_by', opt: true);
  static List<UserEntity>? _$likes(StoryModel v) => v.likes;
  static const Field<StoryModel, List<UserEntity>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<UserEntity>? _$dislikes(StoryModel v) => v.dislikes;
  static const Field<StoryModel, List<UserEntity>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(StoryModel v) => v.text;
  static const Field<StoryModel, String> _f$text =
      Field('text', _$text, opt: true);
  static List<String>? _$media(StoryModel v) => v.media;
  static const Field<StoryModel, List<String>> _f$media =
      Field('media', _$media, opt: true);
  static String? _$city(StoryModel v) => v.city;
  static const Field<StoryModel, String> _f$city =
      Field('city', _$city, opt: true);
  static List<CommentEntity>? _$comments(StoryModel v) => v.comments;
  static const Field<StoryModel, List<CommentEntity>> _f$comments =
      Field('comments', _$comments, opt: true);
  static List<UserEntity>? _$linkedUsers(StoryModel v) => v.linkedUsers;
  static const Field<StoryModel, List<UserEntity>> _f$linkedUsers =
      Field('linkedUsers', _$linkedUsers, mode: FieldMode.member);

  @override
  final MappableFields<StoryModel> fields = const {
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

  static StoryModel _instantiate(DecodingData data) {
    return StoryModel(
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

  static StoryModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StoryModel>(map);
  }

  static StoryModel fromJson(String json) {
    return ensureInitialized().decodeJson<StoryModel>(json);
  }
}

mixin StoryModelMappable {
  String toJson() {
    return StoryModelMapper.ensureInitialized()
        .encodeJson<StoryModel>(this as StoryModel);
  }

  Map<String, dynamic> toMap() {
    return StoryModelMapper.ensureInitialized()
        .encodeMap<StoryModel>(this as StoryModel);
  }

  StoryModelCopyWith<StoryModel, StoryModel, StoryModel> get copyWith =>
      _StoryModelCopyWithImpl(this as StoryModel, $identity, $identity);
  @override
  String toString() {
    return StoryModelMapper.ensureInitialized()
        .stringifyValue(this as StoryModel);
  }

  @override
  bool operator ==(Object other) {
    return StoryModelMapper.ensureInitialized()
        .equalsValue(this as StoryModel, other);
  }

  @override
  int get hashCode {
    return StoryModelMapper.ensureInitialized().hashValue(this as StoryModel);
  }
}

extension StoryModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StoryModel, $Out> {
  StoryModelCopyWith<$R, StoryModel, $Out> get $asStoryModel =>
      $base.as((v, t, t2) => _StoryModelCopyWithImpl(v, t, t2));
}

abstract class StoryModelCopyWith<$R, $In extends StoryModel, $Out>
    implements StoryEntityCopyWith<$R, $In, $Out> {
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
  StoryModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StoryModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StoryModel, $Out>
    implements StoryModelCopyWith<$R, StoryModel, $Out> {
  _StoryModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StoryModel> $mapper =
      StoryModelMapper.ensureInitialized();
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
  StoryModel $make(CopyWithData data) => StoryModel(
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
  StoryModelCopyWith<$R2, StoryModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StoryModelCopyWithImpl($value, $cast, t);
}
