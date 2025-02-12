// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'comment.model.dart';

class CommentModelMapper extends ClassMapperBase<CommentModel> {
  CommentModelMapper._();

  static CommentModelMapper? _instance;
  static CommentModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentModelMapper._());
      CommentEntityMapper.ensureInitialized();
      UserEntityMapper.ensureInitialized();
      ContentVisibilityMapper.ensureInitialized();
      PostEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CommentModel';

  static String _$id(CommentModel v) => v.id;
  static const Field<CommentModel, String> _f$id =
      Field('id', _$id, key: r'_id');
  static bool _$isActive(CommentModel v) => v.isActive;
  static const Field<CommentModel, bool> _f$isActive =
      Field('isActive', _$isActive, key: r'is_active');
  static bool _$isDeleted(CommentModel v) => v.isDeleted;
  static const Field<CommentModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: r'is_deleted');
  static UserEntity _$createdBy(CommentModel v) => v.createdBy;
  static const Field<CommentModel, UserEntity> _f$createdBy =
      Field('createdBy', _$createdBy, key: r'created_by');
  static DateTime _$createdAt(CommentModel v) => v.createdAt;
  static const Field<CommentModel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static ContentVisibility _$visibility(CommentModel v) => v.visibility;
  static const Field<CommentModel, ContentVisibility> _f$visibility =
      Field('visibility', _$visibility);
  static PostEntity _$post(CommentModel v) => v.post;
  static const Field<CommentModel, PostEntity> _f$post = Field('post', _$post);
  static List<UserEntity>? _$likes(CommentModel v) => v.likes;
  static const Field<CommentModel, List<UserEntity>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<UserEntity>? _$dislikes(CommentModel v) => v.dislikes;
  static const Field<CommentModel, List<UserEntity>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(CommentModel v) => v.text;
  static const Field<CommentModel, String> _f$text =
      Field('text', _$text, opt: true);
  static List<String>? _$media(CommentModel v) => v.media;
  static const Field<CommentModel, List<String>> _f$media =
      Field('media', _$media, opt: true);

  @override
  final MappableFields<CommentModel> fields = const {
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

  static CommentModel _instantiate(DecodingData data) {
    return CommentModel(
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

  static CommentModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommentModel>(map);
  }

  static CommentModel fromJson(String json) {
    return ensureInitialized().decodeJson<CommentModel>(json);
  }
}

mixin CommentModelMappable {
  String toJson() {
    return CommentModelMapper.ensureInitialized()
        .encodeJson<CommentModel>(this as CommentModel);
  }

  Map<String, dynamic> toMap() {
    return CommentModelMapper.ensureInitialized()
        .encodeMap<CommentModel>(this as CommentModel);
  }

  CommentModelCopyWith<CommentModel, CommentModel, CommentModel> get copyWith =>
      _CommentModelCopyWithImpl(this as CommentModel, $identity, $identity);
  @override
  String toString() {
    return CommentModelMapper.ensureInitialized()
        .stringifyValue(this as CommentModel);
  }

  @override
  bool operator ==(Object other) {
    return CommentModelMapper.ensureInitialized()
        .equalsValue(this as CommentModel, other);
  }

  @override
  int get hashCode {
    return CommentModelMapper.ensureInitialized()
        .hashValue(this as CommentModel);
  }
}

extension CommentModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommentModel, $Out> {
  CommentModelCopyWith<$R, CommentModel, $Out> get $asCommentModel =>
      $base.as((v, t, t2) => _CommentModelCopyWithImpl(v, t, t2));
}

abstract class CommentModelCopyWith<$R, $In extends CommentModel, $Out>
    implements CommentEntityCopyWith<$R, $In, $Out> {
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity> get createdBy;
  @override
  PostEntityCopyWith<$R, PostEntity, PostEntity> get post;
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get likes;
  @override
  ListCopyWith<$R, UserEntity, UserEntityCopyWith<$R, UserEntity, UserEntity>>?
      get dislikes;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get media;
  @override
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
  CommentModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommentModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommentModel, $Out>
    implements CommentModelCopyWith<$R, CommentModel, $Out> {
  _CommentModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommentModel> $mapper =
      CommentModelMapper.ensureInitialized();
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
  CommentModel $make(CopyWithData data) => CommentModel(
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
  CommentModelCopyWith<$R2, CommentModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommentModelCopyWithImpl($value, $cast, t);
}
