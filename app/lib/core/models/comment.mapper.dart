// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'comment.dart';

class CommentMapper extends ClassMapperBase<Comment> {
  CommentMapper._();

  static CommentMapper? _instance;
  static CommentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentMapper._());
      UserMapper.ensureInitialized();
      PostMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Comment';

  static String _$id(Comment v) => v.id;
  static const Field<Comment, String> _f$id = Field('id', _$id, key: '_id');
  static bool _$isActive(Comment v) => v.isActive;
  static const Field<Comment, bool> _f$isActive =
      Field('isActive', _$isActive, key: 'is_active');
  static bool _$isDeleted(Comment v) => v.isDeleted;
  static const Field<Comment, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: 'is_deleted');
  static User _$createdBy(Comment v) => v.createdBy;
  static const Field<Comment, User> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by');
  static DateTime _$createdAt(Comment v) => v.createdAt;
  static const Field<Comment, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: 'created_at');
  static PostType _$type(Comment v) => v.type;
  static const Field<Comment, PostType> _f$type = Field('type', _$type);
  static Post _$post(Comment v) => v.post;
  static const Field<Comment, Post> _f$post = Field('post', _$post);
  static List<User>? _$likes(Comment v) => v.likes;
  static const Field<Comment, List<User>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<User>? _$dislikes(Comment v) => v.dislikes;
  static const Field<Comment, List<User>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(Comment v) => v.text;
  static const Field<Comment, String> _f$text =
      Field('text', _$text, opt: true);
  static List<String>? _$media(Comment v) => v.media;
  static const Field<Comment, List<String>> _f$media =
      Field('media', _$media, opt: true);

  @override
  final MappableFields<Comment> fields = const {
    #id: _f$id,
    #isActive: _f$isActive,
    #isDeleted: _f$isDeleted,
    #createdBy: _f$createdBy,
    #createdAt: _f$createdAt,
    #type: _f$type,
    #post: _f$post,
    #likes: _f$likes,
    #dislikes: _f$dislikes,
    #text: _f$text,
    #media: _f$media,
  };

  static Comment _instantiate(DecodingData data) {
    return Comment(
        id: data.dec(_f$id),
        isActive: data.dec(_f$isActive),
        isDeleted: data.dec(_f$isDeleted),
        createdBy: data.dec(_f$createdBy),
        createdAt: data.dec(_f$createdAt),
        type: data.dec(_f$type),
        post: data.dec(_f$post),
        likes: data.dec(_f$likes),
        dislikes: data.dec(_f$dislikes),
        text: data.dec(_f$text),
        media: data.dec(_f$media));
  }

  @override
  final Function instantiate = _instantiate;

  static Comment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Comment>(map);
  }

  static Comment fromJson(String json) {
    return ensureInitialized().decodeJson<Comment>(json);
  }
}

mixin CommentMappable {
  String toJson() {
    return CommentMapper.ensureInitialized()
        .encodeJson<Comment>(this as Comment);
  }

  Map<String, dynamic> toMap() {
    return CommentMapper.ensureInitialized()
        .encodeMap<Comment>(this as Comment);
  }

  CommentCopyWith<Comment, Comment, Comment> get copyWith =>
      _CommentCopyWithImpl(this as Comment, $identity, $identity);
  @override
  String toString() {
    return CommentMapper.ensureInitialized().stringifyValue(this as Comment);
  }

  @override
  bool operator ==(Object other) {
    return CommentMapper.ensureInitialized()
        .equalsValue(this as Comment, other);
  }

  @override
  int get hashCode {
    return CommentMapper.ensureInitialized().hashValue(this as Comment);
  }
}

extension CommentValueCopy<$R, $Out> on ObjectCopyWith<$R, Comment, $Out> {
  CommentCopyWith<$R, Comment, $Out> get $asComment =>
      $base.as((v, t, t2) => _CommentCopyWithImpl(v, t, t2));
}

abstract class CommentCopyWith<$R, $In extends Comment, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User> get createdBy;
  PostCopyWith<$R, Post, Post> get post;
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get likes;
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get dislikes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get media;
  $R call(
      {String? id,
      bool? isActive,
      bool? isDeleted,
      User? createdBy,
      DateTime? createdAt,
      PostType? type,
      Post? post,
      List<User>? likes,
      List<User>? dislikes,
      String? text,
      List<String>? media});
  CommentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Comment, $Out>
    implements CommentCopyWith<$R, Comment, $Out> {
  _CommentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Comment> $mapper =
      CommentMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User> get createdBy =>
      $value.createdBy.copyWith.$chain((v) => call(createdBy: v));
  @override
  PostCopyWith<$R, Post, Post> get post =>
      $value.post.copyWith.$chain((v) => call(post: v));
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
  $R call(
          {String? id,
          bool? isActive,
          bool? isDeleted,
          User? createdBy,
          DateTime? createdAt,
          PostType? type,
          Post? post,
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
        if (type != null) #type: type,
        if (post != null) #post: post,
        if (likes != $none) #likes: likes,
        if (dislikes != $none) #dislikes: dislikes,
        if (text != $none) #text: text,
        if (media != $none) #media: media
      }));
  @override
  Comment $make(CopyWithData data) => Comment(
      id: data.get(#id, or: $value.id),
      isActive: data.get(#isActive, or: $value.isActive),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      type: data.get(#type, or: $value.type),
      post: data.get(#post, or: $value.post),
      likes: data.get(#likes, or: $value.likes),
      dislikes: data.get(#dislikes, or: $value.dislikes),
      text: data.get(#text, or: $value.text),
      media: data.get(#media, or: $value.media));

  @override
  CommentCopyWith<$R2, Comment, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CommentCopyWithImpl($value, $cast, t);
}
