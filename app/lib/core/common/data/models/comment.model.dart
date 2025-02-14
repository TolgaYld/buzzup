import 'package:buzzup/core/common/base_interfaces/id_holder.dart';
import 'package:buzzup/core/common/data/models/all_models.dart';
import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:buzzup/core/enums/content_visibility.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';

part 'comment.model.mapper.dart';

@MappableClass()
class CommentModel extends CommentEntity with CommentModelMappable implements IdHolder {
  CommentModel({
    @MappableField(key: '_id') required super.id,
    @MappableField(key: 'is_active') required super.isActive,
    @MappableField(key: 'is_deleted') required super.isDeleted,
    @MappableField(key: 'created_by') required super.createdBy,
    @MappableField(key: 'created_at') @DateTimeConverter() required super.createdAt,
    required super.visibility,
    required super.post,
    super.likes,
    super.dislikes,
    super.text,
    super.media,
  });

  factory CommentModel.empty() => CommentModel(
        id: 'empty',
        isActive: true,
        isDeleted: false,
        createdBy: UserModel.empty(),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        visibility: ContentVisibility.public,
        post: PostModel.empty(),
        likes: [UserModel.empty()],
      );

  CommentEntity toEntity() => CommentEntity(
        id: id,
        isActive: isActive,
        isDeleted: isDeleted,
        createdBy: createdBy,
        createdAt: createdAt,
        visibility: visibility,
        post: post,
        likes: likes,
        dislikes: dislikes,
        text: text,
        media: media,
      );

  static CommentModel fromEntity(CommentEntity entity) => CommentModel(
        id: entity.id,
        isActive: entity.isActive,
        isDeleted: entity.isDeleted,
        createdBy: UserModel.fromEntity(entity.createdBy),
        createdAt: entity.createdAt,
        visibility: entity.visibility,
        post: PostModel.fromEntity(entity.post),
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
      );
}
