import 'package:buzzup/core/models/content.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:buzzup/core/enums/content_visibility.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';

part 'comment.mapper.dart';

@MappableClass()
class Comment with CommentMappable {
  Comment({
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

  factory Comment.empty() => Comment(
        id: 'empty',
        isActive: true,
        isDeleted: false,
        createdBy: User.empty(),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        visibility: ContentVisibility.public,
        post: Post.empty(),
        likes: [User.empty()],
      );

  @MappableField(key: '_id')
  final String id;
  @MappableField(key: 'is_active')
  final bool isActive;
  @MappableField(key: 'is_deleted')
  final bool isDeleted;
  @MappableField(key: 'created_by')
  final User createdBy;
  @DateTimeConverter()
  @MappableField(key: 'created_at')
  final DateTime createdAt;
  final ContentVisibility visibility;
  final Post post;
  final List<User>? likes;
  final List<User>? dislikes;
  final String? text;
  final List<String>? media;
}
