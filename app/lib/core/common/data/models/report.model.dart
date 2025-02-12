import 'package:buzzup/core/common/data/models/all_models.dart';
import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';

part 'report.model.mapper.dart';

@MappableClass()
class ReportModel extends ReportEntity with ReportModelMappable {
  ReportModel({
    @MappableField(key: '_id') required super.id,
    @MappableField(key: 'is_done') required super.isDone,
    @MappableField(key: 'created_by') required super.createdBy,
    @MappableField(key: 'created_at') @DateTimeConverter() required super.createdAt,
    required super.reason,
    @MappableField(key: 'reported_user') super.reportedUser,
    @MappableField(key: 'post') super.post,
    @MappableField(key: 'comment') super.comment,
    @MappableField(key: 'channel') super.channel,
    @MappableField(key: 'story') super.story,
    super.city,
    super.notesAboutReport,
  });

  factory ReportModel.empty() => ReportModel(
        id: 'empty',
        reportedUser: UserModel.empty(),
        isDone: false,
        createdBy: UserModel.empty(),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        reason: 'empty',
      );

  ReportEntity toEntity() => ReportEntity(
        id: id,
        isDone: isDone,
        createdBy: createdBy,
        createdAt: createdAt,
        reason: reason,
        reportedUser: reportedUser,
        post: post,
        comment: comment,
        channel: channel,
        story: story,
        city: city,
        notesAboutReport: notesAboutReport,
      );

  static ReportModel fromEntity(ReportEntity entity) => ReportModel(
        id: entity.id,
        isDone: entity.isDone,
        createdBy: UserModel.fromEntity(entity.createdBy),
        createdAt: entity.createdAt,
        reason: entity.reason,
        reportedUser: switch (entity.reportedUser) {
          final user? => UserModel.fromEntity(user),
          _ => null,
        },
        post: switch (entity.post) {
          final post? => PostModel.fromEntity(post),
          _ => null,
        },
        comment: switch (entity.comment) {
          final comment? => CommentModel.fromEntity(comment),
          _ => null,
        },
        channel: switch (entity.channel) {
          final channel? => ChannelModel.fromEntity(channel),
          _ => null,
        },
        story: switch (entity.story) {
          final story? => StoryModel.fromEntity(story),
          _ => null,
        },
        city: entity.city,
        notesAboutReport: entity.notesAboutReport,
      );
}
