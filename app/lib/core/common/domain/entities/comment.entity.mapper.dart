// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'comment.entity.dart';

class CommentEntityMapper extends ClassMapperBase<CommentEntity> {
  CommentEntityMapper._();

  static CommentEntityMapper? _instance;
  static CommentEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentEntityMapper._());
      UserEntityMapper.ensureInitialized();
      ContentVisibilityMapper.ensureInitialized();
      PostEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CommentEntity';

  static String _$id(CommentEntity v) => v.id;
  static const Field<CommentEntity, String> _f$id = Field('id', _$id);
  static bool _$isActive(CommentEntity v) => v.isActive;
  static const Field<CommentEntity, bool> _f$isActive =
      Field('isActive', _$isActive);
  static bool _$isDeleted(CommentEntity v) => v.isDeleted;
  static const Field<CommentEntity, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted);
  static UserEntity _$createdBy(CommentEntity v) => v.createdBy;
  static const Field<CommentEntity, UserEntity> _f$createdBy =
      Field('createdBy', _$createdBy);
  static DateTime _$createdAt(CommentEntity v) => v.createdAt;
  static const Field<CommentEntity, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static ContentVisibility _$visibility(CommentEntity v) => v.visibility;
  static const Field<CommentEntity, ContentVisibility> _f$visibility =
      Field('visibility', _$visibility);
  static PostEntity _$post(CommentEntity v) => v.post;
  static const Field<CommentEntity, PostEntity> _f$post = Field('post', _$post);
  static List<UserEntity>? _$likes(CommentEntity v) => v.likes;
  static const Field<CommentEntity, List<UserEntity>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<UserEntity>? _$dislikes(CommentEntity v) => v.dislikes;
  static const Field<CommentEntity, List<UserEntity>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(CommentEntity v) => v.text;
  static const Field<CommentEntity, String> _f$text =
      Field('text', _$text, opt: true);
  static List<String>? _$media(CommentEntity v) => v.media;
  static const Field<CommentEntity, List<String>> _f$media =
      Field('media', _$media, opt: true);

  @override
  final MappableFields<CommentEntity> fields = const {
    #id: _f$id,
    #isActive: _f$isActive,
    #isDeleted: _f$isDeleted,
    #createdBy: _f$createdBy,
    #createdAt: _f$createdAt,
    #visibility: _f$visibility,
    #post: _f$post,
    #likes: _f$likes,
    #dislikes: _f$dislikes,
    #text: _f$text,
    #media: _f$media,
  };

  static CommentEntity _instantiate(DecodingData data) {
    return CommentEntity(
        id: data.dec(_f$id),
        isActive: data.dec(_f$isActive),
        isDeleted: data.dec(_f$isDeleted),
        createdBy: data.dec(_f$createdBy),
        createdAt: data.dec(_f$createdAt),
        visibility: data.dec(_f$visibility),
        post: data.dec(_f$post),
        likes: data.dec(_f$likes),
        dislikes: data.dec(_f$dislikes),
        text: data.dec(_f$text),
        media: data.dec(_f$media));
  }

  @override
  final Function instantiate = _instantiate;

  static CommentEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommentEntity>(map);
  }

  static CommentEntity fromJson(String json) {
    return ensureInitialized().decodeJson<CommentEntity>(json);
  }
}

mixin CommentEntityMappable {
  String toJson() {
    return CommentEntityMapper.ensureInitialized()
        .encodeJson<CommentEntity>(this as CommentEntity);
  }

  Map<String, dynamic> toMap() {
    return CommentEntityMapper.ensureInitialized()
        .encodeMap<CommentEntity>(this as CommentEntity);
  }

  CommentEntityCopyWith<CommentEntity, CommentEntity, CommentEntity>
      get copyWith => _CommentEntityCopyWithImpl(
          this as CommentEntity, $identity, $identity);
  @override
  String toString() {
    return CommentEntityMapper.ensureInitialized()
        .stringifyValue(this as CommentEntity);
  }

  @override
  bool operator ==(Object other) {
    return CommentEntityMapper.ensureInitialized()
        .equalsValue(this as CommentEntity, other);
  }

  @override
  int get hashCode {
    return CommentEntityMapper.ensureInitialized()
        .hashValue(this as CommentEntity);
  }
}

extension CommentEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommentEntity, $Out> {
  CommentEntityCopyWith<$R, CommentEntity, $Out> get $asCommentEntity =>
      $base.as((v, t, t2) => _CommentEntityCopyWithImpl(v, t, t2));
}

abstract class CommentEntityCopyWith<$R, $In extends CommentEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserEntityCopyWith<$R, UserEntity, UserEntity> get createdBy;
  PostEntityCopyWith<$R, PostEntity, PostEntity> get post;
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get likes;
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get dislikes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get media;
  $R call(
      {String? id,
      bool? isActive,
      bool? isDeleted,
      UserEntity? createdBy,
      DateTime? createdAt,
      ContentVisibility? visibility,
      PostEntity? post,
      List<UserEntity>? likes,
      List<UserEntity>? dislikes,
      String? text,
      List<String>? media});
  CommentEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommentEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommentEntity, $Out>
    implements CommentEntityCopyWith<$R, CommentEntity, $Out> {
  _CommentEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommentEntity> $mapper =
      CommentEntityMapper.ensureInitialized();
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity> get createdBy =>
      $value.createdBy.copyWith.$chain((v) => call(createdBy: v));
  @override
  PostEntityCopyWith<$R, PostEntity, PostEntity> get post =>
      $value.post.copyWith.$chain((v) => call(post: v));
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
  $R call(
          {String? id,
          bool? isActive,
          bool? isDeleted,
          UserEntity? createdBy,
          DateTime? createdAt,
          ContentVisibility? visibility,
          PostEntity? post,
          Object? likes = $none,
          Object? dislikes = $none,
          Object? text = $none,
          Object? media = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (isActive != null) #isActive: isActive,
        if (isDeleted != null) #isDeleted: isDeleted,
        if (createdBy != null) #createdBy: createdBy,
        if (createdAt != null) #createdAt: createdAt,
        if (visibility != null) #visibility: visibility,
        if (post != null) #post: post,
        if (likes != $none) #likes: likes,
        if (dislikes != $none) #dislikes: dislikes,
        if (text != $none) #text: text,
        if (media != $none) #media: media
      }));
  @override
  CommentEntity $make(CopyWithData data) => CommentEntity(
      id: data.get(#id, or: $value.id),
      isActive: data.get(#isActive, or: $value.isActive),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      visibility: data.get(#visibility, or: $value.visibility),
      post: data.get(#post, or: $value.post),
      likes: data.get(#likes, or: $value.likes),
      dislikes: data.get(#dislikes, or: $value.dislikes),
      text: data.get(#text, or: $value.text),
      media: data.get(#media, or: $value.media));

  @override
  CommentEntityCopyWith<$R2, CommentEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommentEntityCopyWithImpl($value, $cast, t);
}
