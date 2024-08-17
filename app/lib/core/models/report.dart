import 'package:buzzup/core/models/channel.dart';
import 'package:buzzup/core/models/comment.dart';
import 'package:buzzup/core/models/post.dart';
import 'package:buzzup/core/models/story.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';

part 'report.mapper.dart';

@MappableClass()
class Report with ReportMappable {
  Report({
    required this.id,
    required this.isDone,
    required this.createdBy,
    required this.createdAt,
    required this.reason,
    this.reportedUser,
    this.post,
    this.comment,
    this.channel,
    this.story,
    this.city,
    this.notesAboutReport,
  });

  factory Report.empty() => Report(
        id: 'empty',
        reportedUser: User.empty(),
        isDone: false,
        createdBy: User.empty(),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        reason: 'empty',
      );

  @MappableField(key: '_id')
  final String id;
  @MappableField(key: 'is_done')
  final bool isDone;
  @MappableField(key: 'created_by')
  final User createdBy;
  @DateTimeConverter()
  @MappableField(key: 'created_at')
  final DateTime createdAt;
  final String reason;
  @MappableField(key: 'reported_user')
  final User? reportedUser;
  final Post? post;
  final Comment? comment;
  final Channel? channel;
  final Story? story;
  final String? city;
  final String? notesAboutReport;
}
