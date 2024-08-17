import 'package:buzzup/core/models/post.dart';
import 'package:buzzup/core/models/story.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';

part 'channel.mapper.dart';

@MappableClass()
class Channel with ChannelMappable {
  Channel({
    required this.id,
    required this.name,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    this.subscriptions,
    this.createdBy,
    this.posts,
    this.storys,
  });

  factory Channel.empty() => Channel(
        id: 'empty',
        name: 'empty',
        isActive: true,
        isDeleted: false,
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: User.empty(),
      );

  @MappableField(key: '_id')
  final String id;
  final String name;
  @MappableField(key: 'is_active')
  final bool isActive;
  @MappableField(key: 'is_deleted')
  final bool isDeleted;
  @DateTimeConverter()
  @MappableField(key: 'created_at')
  final DateTime createdAt;
  final List<User>? subscriptions;
  @MappableField(key: 'created_by')
  final User? createdBy;
  final List<Post>? posts;
  final List<Story>? storys;
}
