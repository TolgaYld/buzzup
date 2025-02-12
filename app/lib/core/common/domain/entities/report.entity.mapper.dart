// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'report.entity.dart';

class ReportEntityMapper extends ClassMapperBase<ReportEntity> {
  ReportEntityMapper._();

  static ReportEntityMapper? _instance;
  static ReportEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReportEntityMapper._());
      UserEntityMapper.ensureInitialized();
      PostEntityMapper.ensureInitialized();
      CommentEntityMapper.ensureInitialized();
      ChannelEntityMapper.ensureInitialized();
      StoryEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ReportEntity';

  static String _$id(ReportEntity v) => v.id;
  static const Field<ReportEntity, String> _f$id = Field('id', _$id);
  static bool _$isDone(ReportEntity v) => v.isDone;
  static const Field<ReportEntity, bool> _f$isDone = Field('isDone', _$isDone);
  static UserEntity _$createdBy(ReportEntity v) => v.createdBy;
  static const Field<ReportEntity, UserEntity> _f$createdBy =
      Field('createdBy', _$createdBy);
  static DateTime _$createdAt(ReportEntity v) => v.createdAt;
  static const Field<ReportEntity, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static String _$reason(ReportEntity v) => v.reason;
  static const Field<ReportEntity, String> _f$reason =
      Field('reason', _$reason);
  static UserEntity? _$reportedUser(ReportEntity v) => v.reportedUser;
  static const Field<ReportEntity, UserEntity> _f$reportedUser =
      Field('reportedUser', _$reportedUser, opt: true);
  static PostEntity? _$post(ReportEntity v) => v.post;
  static const Field<ReportEntity, PostEntity> _f$post =
      Field('post', _$post, opt: true);
  static CommentEntity? _$comment(ReportEntity v) => v.comment;
  static const Field<ReportEntity, CommentEntity> _f$comment =
      Field('comment', _$comment, opt: true);
  static ChannelEntity? _$channel(ReportEntity v) => v.channel;
  static const Field<ReportEntity, ChannelEntity> _f$channel =
      Field('channel', _$channel, opt: true);
  static StoryEntity? _$story(ReportEntity v) => v.story;
  static const Field<ReportEntity, StoryEntity> _f$story =
      Field('story', _$story, opt: true);
  static String? _$city(ReportEntity v) => v.city;
  static const Field<ReportEntity, String> _f$city =
      Field('city', _$city, opt: true);
  static String? _$notesAboutReport(ReportEntity v) => v.notesAboutReport;
  static const Field<ReportEntity, String> _f$notesAboutReport =
      Field('notesAboutReport', _$notesAboutReport, opt: true);

  @override
  final MappableFields<ReportEntity> fields = const {
    #id: _f$id,
    #isDone: _f$isDone,
    #createdBy: _f$createdBy,
    #createdAt: _f$createdAt,
    #reason: _f$reason,
    #reportedUser: _f$reportedUser,
    #post: _f$post,
    #comment: _f$comment,
    #channel: _f$channel,
    #story: _f$story,
    #city: _f$city,
    #notesAboutReport: _f$notesAboutReport,
  };

  static ReportEntity _instantiate(DecodingData data) {
    return ReportEntity(
        id: data.dec(_f$id),
        isDone: data.dec(_f$isDone),
        createdBy: data.dec(_f$createdBy),
        createdAt: data.dec(_f$createdAt),
        reason: data.dec(_f$reason),
        reportedUser: data.dec(_f$reportedUser),
        post: data.dec(_f$post),
        comment: data.dec(_f$comment),
        channel: data.dec(_f$channel),
        story: data.dec(_f$story),
        city: data.dec(_f$city),
        notesAboutReport: data.dec(_f$notesAboutReport));
  }

  @override
  final Function instantiate = _instantiate;

  static ReportEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReportEntity>(map);
  }

  static ReportEntity fromJson(String json) {
    return ensureInitialized().decodeJson<ReportEntity>(json);
  }
}

mixin ReportEntityMappable {
  String toJson() {
    return ReportEntityMapper.ensureInitialized()
        .encodeJson<ReportEntity>(this as ReportEntity);
  }

  Map<String, dynamic> toMap() {
    return ReportEntityMapper.ensureInitialized()
        .encodeMap<ReportEntity>(this as ReportEntity);
  }

  ReportEntityCopyWith<ReportEntity, ReportEntity, ReportEntity> get copyWith =>
      _ReportEntityCopyWithImpl(this as ReportEntity, $identity, $identity);
  @override
  String toString() {
    return ReportEntityMapper.ensureInitialized()
        .stringifyValue(this as ReportEntity);
  }

  @override
  bool operator ==(Object other) {
    return ReportEntityMapper.ensureInitialized()
        .equalsValue(this as ReportEntity, other);
  }

  @override
  int get hashCode {
    return ReportEntityMapper.ensureInitialized()
        .hashValue(this as ReportEntity);
  }
}

extension ReportEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReportEntity, $Out> {
  ReportEntityCopyWith<$R, ReportEntity, $Out> get $asReportEntity =>
      $base.as((v, t, t2) => _ReportEntityCopyWithImpl(v, t, t2));
}

abstract class ReportEntityCopyWith<$R, $In extends ReportEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserEntityCopyWith<$R, UserEntity, UserEntity> get createdBy;
  UserEntityCopyWith<$R, UserEntity, UserEntity>? get reportedUser;
  PostEntityCopyWith<$R, PostEntity, PostEntity>? get post;
  CommentEntityCopyWith<$R, CommentEntity, CommentEntity>? get comment;
  ChannelEntityCopyWith<$R, ChannelEntity, ChannelEntity>? get channel;
  StoryEntityCopyWith<$R, StoryEntity, StoryEntity>? get story;
  $R call(
      {String? id,
      bool? isDone,
      UserEntity? createdBy,
      DateTime? createdAt,
      String? reason,
      UserEntity? reportedUser,
      PostEntity? post,
      CommentEntity? comment,
      ChannelEntity? channel,
      StoryEntity? story,
      String? city,
      String? notesAboutReport});
  ReportEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReportEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReportEntity, $Out>
    implements ReportEntityCopyWith<$R, ReportEntity, $Out> {
  _ReportEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReportEntity> $mapper =
      ReportEntityMapper.ensureInitialized();
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity> get createdBy =>
      $value.createdBy.copyWith.$chain((v) => call(createdBy: v));
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity>? get reportedUser =>
      $value.reportedUser?.copyWith.$chain((v) => call(reportedUser: v));
  @override
  PostEntityCopyWith<$R, PostEntity, PostEntity>? get post =>
      $value.post?.copyWith.$chain((v) => call(post: v));
  @override
  CommentEntityCopyWith<$R, CommentEntity, CommentEntity>? get comment =>
      $value.comment?.copyWith.$chain((v) => call(comment: v));
  @override
  ChannelEntityCopyWith<$R, ChannelEntity, ChannelEntity>? get channel =>
      $value.channel?.copyWith.$chain((v) => call(channel: v));
  @override
  StoryEntityCopyWith<$R, StoryEntity, StoryEntity>? get story =>
      $value.story?.copyWith.$chain((v) => call(story: v));
  @override
  $R call(
          {String? id,
          bool? isDone,
          UserEntity? createdBy,
          DateTime? createdAt,
          String? reason,
          Object? reportedUser = $none,
          Object? post = $none,
          Object? comment = $none,
          Object? channel = $none,
          Object? story = $none,
          Object? city = $none,
          Object? notesAboutReport = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (isDone != null) #isDone: isDone,
        if (createdBy != null) #createdBy: createdBy,
        if (createdAt != null) #createdAt: createdAt,
        if (reason != null) #reason: reason,
        if (reportedUser != $none) #reportedUser: reportedUser,
        if (post != $none) #post: post,
        if (comment != $none) #comment: comment,
        if (channel != $none) #channel: channel,
        if (story != $none) #story: story,
        if (city != $none) #city: city,
        if (notesAboutReport != $none) #notesAboutReport: notesAboutReport
      }));
  @override
  ReportEntity $make(CopyWithData data) => ReportEntity(
      id: data.get(#id, or: $value.id),
      isDone: data.get(#isDone, or: $value.isDone),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      reason: data.get(#reason, or: $value.reason),
      reportedUser: data.get(#reportedUser, or: $value.reportedUser),
      post: data.get(#post, or: $value.post),
      comment: data.get(#comment, or: $value.comment),
      channel: data.get(#channel, or: $value.channel),
      story: data.get(#story, or: $value.story),
      city: data.get(#city, or: $value.city),
      notesAboutReport:
          data.get(#notesAboutReport, or: $value.notesAboutReport));

  @override
  ReportEntityCopyWith<$R2, ReportEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReportEntityCopyWithImpl($value, $cast, t);
}
