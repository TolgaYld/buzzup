import 'package:buzzup/core/common/domain/entities/content.entity.dart';
import 'package:buzzup/core/common/domain/entities/user.entity.dart';
import 'package:buzzup/core/enums/content_visibility.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'comment.entity.mapper.dart';

@MappableClass()
class CommentEntity with CommentEntityMappable {
  CommentEntity({
    required this.id,
    required this.isActive,
    required this.isDeleted,
    required this.createdBy,
    required this.createdAt,
    required this.visibility,
    required this.post,
    this.likes,
    this.dislikes,
    this.text,
    this.media,
  });

  factory CommentEntity.empty() => CommentEntity(
        id: 'empty',
        isActive: true,
        isDeleted: false,
        createdBy: UserEntity.empty(),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        visibility: ContentVisibility.public,
        post: PostEntity.empty(),
        likes: [UserEntity.empty()],
      );

  final String id;
  final bool isActive;
  final bool isDeleted;
  final UserEntity createdBy;
  final DateTime createdAt;
  final ContentVisibility visibility;
  final PostEntity post;
  final List<UserEntity>? likes;
  final List<UserEntity>? dislikes;
  final String? text;
  final List<String>? media;
}
