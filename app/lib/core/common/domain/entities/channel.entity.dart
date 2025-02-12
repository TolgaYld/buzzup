import 'package:buzzup/core/common/domain/entities/content.entity.dart';
import 'package:buzzup/core/common/domain/entities/user.entity.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'channel.entity.mapper.dart';

@MappableClass()
class ChannelEntity with ChannelEntityMappable {
  ChannelEntity({
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

  factory ChannelEntity.empty() => ChannelEntity(
        id: 'empty',
        name: 'empty',
        isActive: true,
        isDeleted: false,
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: UserEntity.empty(),
      );

  final String id;
  final String name;
  final bool isActive;
  final bool isDeleted;
  final DateTime createdAt;
  final List<UserEntity>? subscriptions;
  final UserEntity? createdBy;
  final List<PostEntity>? posts;
  final List<StoryEntity>? storys;
}
