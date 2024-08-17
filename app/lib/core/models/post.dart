import 'package:buzzup/core/models/channel.dart';
import 'package:buzzup/core/models/comment.dart';
import 'package:buzzup/core/models/location.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:buzzup/core/enums/post_type.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';

part 'post.mapper.dart';

@MappableClass()
class Post with PostMappable {
  Post({
    required this.id,
    required this.isActive,
    required this.isDeleted,
    required this.createdBy,
    required this.createdAt,
    required this.location,
    required this.type,
    required this.channels,
    this.likes,
    this.dislikes,
    this.text,
    this.media,
    this.city,
    this.comments,
  });

  factory Post.empty() => Post(
        id: 'empty',
        isActive: true,
        isDeleted: false,
        createdBy: User.empty(),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        location: Location.empty(),
        type: PostType.anonymous,
        channels: [Channel.empty()],
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
  final Location location;
  final PostType type;
  final List<Channel>? channels;
  final List<User>? likes;
  final List<User>? dislikes;
  final String? text;
  final List<String>? media;
  final String? city;
  final List<Comment>? comments;
}
