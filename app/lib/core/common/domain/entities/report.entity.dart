import 'package:buzzup/core/common/domain/entities/channel.entity.dart';
import 'package:buzzup/core/common/domain/entities/comment.entity.dart';
import 'package:buzzup/core/common/domain/entities/content.entity.dart';
import 'package:buzzup/core/common/domain/entities/user.entity.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'report.entity.mapper.dart';

@MappableClass()
class ReportEntity with ReportEntityMappable {
  ReportEntity({
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

  factory ReportEntity.empty() => ReportEntity(
        id: 'empty',
        reportedUser: UserEntity.empty(),
        isDone: false,
        createdBy: UserEntity.empty(),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        reason: 'empty',
      );

  final String id;
  final bool isDone;
  final UserEntity createdBy;
  final DateTime createdAt;
  final String reason;
  final UserEntity? reportedUser;
  final PostEntity? post;
  final CommentEntity? comment;
  final ChannelEntity? channel;
  final StoryEntity? story;
  final String? city;
  final String? notesAboutReport;
}
