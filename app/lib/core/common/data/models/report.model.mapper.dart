// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'report.model.dart';

class ReportModelMapper extends ClassMapperBase<ReportModel> {
  ReportModelMapper._();

  static ReportModelMapper? _instance;
  static ReportModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReportModelMapper._());
      ReportEntityMapper.ensureInitialized();
      UserEntityMapper.ensureInitialized();
      PostEntityMapper.ensureInitialized();
      CommentEntityMapper.ensureInitialized();
      ChannelEntityMapper.ensureInitialized();
      StoryEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ReportModel';

  static String _$id(ReportModel v) => v.id;
  static const Field<ReportModel, String> _f$id =
      Field('id', _$id, key: r'_id');
  static bool _$isDone(ReportModel v) => v.isDone;
  static const Field<ReportModel, bool> _f$isDone =
      Field('isDone', _$isDone, key: r'is_done');
  static UserEntity _$createdBy(ReportModel v) => v.createdBy;
  static const Field<ReportModel, UserEntity> _f$createdBy =
      Field('createdBy', _$createdBy, key: r'created_by');
  static DateTime _$createdAt(ReportModel v) => v.createdAt;
  static const Field<ReportModel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static String _$reason(ReportModel v) => v.reason;
  static const Field<ReportModel, String> _f$reason = Field('reason', _$reason);
  static UserEntity? _$reportedUser(ReportModel v) => v.reportedUser;
  static const Field<ReportModel, UserEntity> _f$reportedUser =
      Field('reportedUser', _$reportedUser, key: r'reported_user', opt: true);
  static PostEntity? _$post(ReportModel v) => v.post;
  static const Field<ReportModel, PostEntity> _f$post =
      Field('post', _$post, opt: true);
  static CommentEntity? _$comment(ReportModel v) => v.comment;
  static const Field<ReportModel, CommentEntity> _f$comment =
      Field('comment', _$comment, opt: true);
  static ChannelEntity? _$channel(ReportModel v) => v.channel;
  static const Field<ReportModel, ChannelEntity> _f$channel =
      Field('channel', _$channel, opt: true);
  static StoryEntity? _$story(ReportModel v) => v.story;
  static const Field<ReportModel, StoryEntity> _f$story =
      Field('story', _$story, opt: true);
  static String? _$city(ReportModel v) => v.city;
  static const Field<ReportModel, String> _f$city =
      Field('city', _$city, opt: true);
  static String? _$notesAboutReport(ReportModel v) => v.notesAboutReport;
  static const Field<ReportModel, String> _f$notesAboutReport =
      Field('notesAboutReport', _$notesAboutReport, opt: true);

  @override
  final MappableFields<ReportModel> fields = const {
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

  static ReportModel _instantiate(DecodingData data) {
    return ReportModel(
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

  static ReportModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReportModel>(map);
  }

  static ReportModel fromJson(String json) {
    return ensureInitialized().decodeJson<ReportModel>(json);
  }
}

mixin ReportModelMappable {
  String toJson() {
    return ReportModelMapper.ensureInitialized()
        .encodeJson<ReportModel>(this as ReportModel);
  }

  Map<String, dynamic> toMap() {
    return ReportModelMapper.ensureInitialized()
        .encodeMap<ReportModel>(this as ReportModel);
  }

  ReportModelCopyWith<ReportModel, ReportModel, ReportModel> get copyWith =>
      _ReportModelCopyWithImpl(this as ReportModel, $identity, $identity);
  @override
  String toString() {
    return ReportModelMapper.ensureInitialized()
        .stringifyValue(this as ReportModel);
  }

  @override
  bool operator ==(Object other) {
    return ReportModelMapper.ensureInitialized()
        .equalsValue(this as ReportModel, other);
  }

  @override
  int get hashCode {
    return ReportModelMapper.ensureInitialized().hashValue(this as ReportModel);
  }
}

extension ReportModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReportModel, $Out> {
  ReportModelCopyWith<$R, ReportModel, $Out> get $asReportModel =>
      $base.as((v, t, t2) => _ReportModelCopyWithImpl(v, t, t2));
}

abstract class ReportModelCopyWith<$R, $In extends ReportModel, $Out>
    implements ReportEntityCopyWith<$R, $In, $Out> {
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity> get createdBy;
  @override
  UserEntityCopyWith<$R, UserEntity, UserEntity>? get reportedUser;
  @override
  PostEntityCopyWith<$R, PostEntity, PostEntity>? get post;
  @override
  CommentEntityCopyWith<$R, CommentEntity, CommentEntity>? get comment;
  @override
  ChannelEntityCopyWith<$R, ChannelEntity, ChannelEntity>? get channel;
  @override
  StoryEntityCopyWith<$R, StoryEntity, StoryEntity>? get story;
  @override
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
  ReportModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReportModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReportModel, $Out>
    implements ReportModelCopyWith<$R, ReportModel, $Out> {
  _ReportModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReportModel> $mapper =
      ReportModelMapper.ensureInitialized();
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
  ReportModel $make(CopyWithData data) => ReportModel(
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
  ReportModelCopyWith<$R2, ReportModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReportModelCopyWithImpl($value, $cast, t);
}
