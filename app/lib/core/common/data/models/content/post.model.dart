import 'package:buzzup/core/common/data/models/all_models.dart';
import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/enums/content_visibility.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'post.model.mapper.dart';

@MappableClass()
class PostModel extends PostEntity with PostModelMappable {
  PostModel({
    @MappableField(key: '_id') required super.id,
    required super.channels,
    required super.location,
    required super.visibility,
    @MappableField(key: 'is_active') required super.isActive,
    @MappableField(key: 'is_deleted') required super.isDeleted,
    @MappableField(key: 'created_at') @DateTimeConverter() required super.createdAt,
    @MappableField(key: 'created_by') required super.createdBy,
    @MappableField(key: 'updated_at') @DateTimeConverter() super.updatedAt,
    @MappableField(key: 'updated_by') super.updatedBy,
    super.likes,
    super.dislikes,
    super.text,
    super.media,
    super.city,
    super.comments,
    @MappableField(key: 'end_date') super.endDate,
  });

  factory PostModel.empty() => PostModel(
        id: 'empty',
        location: LocationModel.empty(),
        visibility: ContentVisibility.anonymous,
        channels: [ChannelModel.empty()],
        endDate: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: UserModel.empty(),
        isActive: true,
        isDeleted: false,
      );

  PostEntity toEntity() => PostEntity(
        id: id,
        location: location,
        visibility: visibility,
        channels: channels,
        endDate: endDate,
        createdAt: createdAt,
        createdBy: createdBy,
        isActive: isActive,
        isDeleted: isDeleted,
        updatedAt: updatedAt,
        updatedBy: updatedBy,
        likes: likes,
        dislikes: dislikes,
        text: text,
        media: media,
        city: city,
        comments: comments,
      );

  static PostModel fromEntity(PostEntity entity) => PostModel(
        id: entity.id,
        location: LocationModel.fromEntity(entity.location),
        visibility: entity.visibility,
        channels: entity.channels.map(ChannelModel.fromEntity).toList(),
        endDate: entity.endDate,
        createdAt: entity.createdAt,
        createdBy: UserModel.fromEntity(entity.createdBy),
        isActive: entity.isActive,
        isDeleted: entity.isDeleted,
        updatedAt: entity.updatedAt,
        updatedBy: switch (entity.updatedBy) {
          final user? => UserModel.fromEntity(user),
          _ => null,
        },
        likes: switch (entity.likes) {
          final likes? => likes.map(UserModel.fromEntity).toList(),
          _ => null,
        },
        dislikes: switch (entity.dislikes) {
          final dislikes? => dislikes.map(UserModel.fromEntity).toList(),
          _ => null,
        },
        text: entity.text,
        media: entity.media,
        city: entity.city,
        comments: switch (entity.comments) {
          final comments? => comments.map(CommentModel.fromEntity).toList(),
          _ => null,
        },
      );
}
