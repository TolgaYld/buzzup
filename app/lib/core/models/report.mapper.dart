// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'report.dart';

class ReportMapper extends ClassMapperBase<Report> {
  ReportMapper._();

  static ReportMapper? _instance;
  static ReportMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReportMapper._());
      UserMapper.ensureInitialized();
      PostMapper.ensureInitialized();
      CommentMapper.ensureInitialized();
      ChannelMapper.ensureInitialized();
      StoryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Report';

  static String _$id(Report v) => v.id;
  static const Field<Report, String> _f$id = Field('id', _$id, key: r'_id');
  static bool _$isDone(Report v) => v.isDone;
  static const Field<Report, bool> _f$isDone =
      Field('isDone', _$isDone, key: r'is_done');
  static User _$createdBy(Report v) => v.createdBy;
  static const Field<Report, User> _f$createdBy =
      Field('createdBy', _$createdBy, key: r'created_by');
  static DateTime _$createdAt(Report v) => v.createdAt;
  static const Field<Report, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static String _$reason(Report v) => v.reason;
  static const Field<Report, String> _f$reason = Field('reason', _$reason);
  static User? _$reportedUser(Report v) => v.reportedUser;
  static const Field<Report, User> _f$reportedUser =
      Field('reportedUser', _$reportedUser, key: r'reported_user', opt: true);
  static Post? _$post(Report v) => v.post;
  static const Field<Report, Post> _f$post = Field('post', _$post, opt: true);
  static Comment? _$comment(Report v) => v.comment;
  static const Field<Report, Comment> _f$comment =
      Field('comment', _$comment, opt: true);
  static Channel? _$channel(Report v) => v.channel;
  static const Field<Report, Channel> _f$channel =
      Field('channel', _$channel, opt: true);
  static Story? _$story(Report v) => v.story;
  static const Field<Report, Story> _f$story =
      Field('story', _$story, opt: true);
  static String? _$city(Report v) => v.city;
  static const Field<Report, String> _f$city = Field('city', _$city, opt: true);
  static String? _$notesAboutReport(Report v) => v.notesAboutReport;
  static const Field<Report, String> _f$notesAboutReport =
      Field('notesAboutReport', _$notesAboutReport, opt: true);

  @override
  final MappableFields<Report> fields = const {
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

  static Report _instantiate(DecodingData data) {
    return Report(
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

  static Report fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Report>(map);
  }

  static Report fromJson(String json) {
    return ensureInitialized().decodeJson<Report>(json);
  }
}

mixin ReportMappable {
  String toJson() {
    return ReportMapper.ensureInitialized().encodeJson<Report>(this as Report);
  }

  Map<String, dynamic> toMap() {
    return ReportMapper.ensureInitialized().encodeMap<Report>(this as Report);
  }

  ReportCopyWith<Report, Report, Report> get copyWith =>
      _ReportCopyWithImpl(this as Report, $identity, $identity);
  @override
  String toString() {
    return ReportMapper.ensureInitialized().stringifyValue(this as Report);
  }

  @override
  bool operator ==(Object other) {
    return ReportMapper.ensureInitialized().equalsValue(this as Report, other);
  }

  @override
  int get hashCode {
    return ReportMapper.ensureInitialized().hashValue(this as Report);
  }
}

extension ReportValueCopy<$R, $Out> on ObjectCopyWith<$R, Report, $Out> {
  ReportCopyWith<$R, Report, $Out> get $asReport =>
      $base.as((v, t, t2) => _ReportCopyWithImpl(v, t, t2));
}

abstract class ReportCopyWith<$R, $In extends Report, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User> get createdBy;
  UserCopyWith<$R, User, User>? get reportedUser;
  PostCopyWith<$R, Post, Post>? get post;
  CommentCopyWith<$R, Comment, Comment>? get comment;
  ChannelCopyWith<$R, Channel, Channel>? get channel;
  StoryCopyWith<$R, Story, Story>? get story;
  $R call(
      {String? id,
      bool? isDone,
      User? createdBy,
      DateTime? createdAt,
      String? reason,
      User? reportedUser,
      Post? post,
      Comment? comment,
      Channel? channel,
      Story? story,
      String? city,
      String? notesAboutReport});
  ReportCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReportCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Report, $Out>
    implements ReportCopyWith<$R, Report, $Out> {
  _ReportCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Report> $mapper = ReportMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User> get createdBy =>
      $value.createdBy.copyWith.$chain((v) => call(createdBy: v));
  @override
  UserCopyWith<$R, User, User>? get reportedUser =>
      $value.reportedUser?.copyWith.$chain((v) => call(reportedUser: v));
  @override
  PostCopyWith<$R, Post, Post>? get post =>
      $value.post?.copyWith.$chain((v) => call(post: v));
  @override
  CommentCopyWith<$R, Comment, Comment>? get comment =>
      $value.comment?.copyWith.$chain((v) => call(comment: v));
  @override
  ChannelCopyWith<$R, Channel, Channel>? get channel =>
      $value.channel?.copyWith.$chain((v) => call(channel: v));
  @override
  StoryCopyWith<$R, Story, Story>? get story =>
      $value.story?.copyWith.$chain((v) => call(story: v));
  @override
  $R call(
          {String? id,
          bool? isDone,
          User? createdBy,
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
  Report $make(CopyWithData data) => Report(
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
  ReportCopyWith<$R2, Report, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ReportCopyWithImpl($value, $cast, t);
}
