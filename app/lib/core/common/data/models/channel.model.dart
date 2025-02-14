import 'package:buzzup/core/common/base_interfaces/id_holder.dart';
import 'package:buzzup/core/common/data/models/all_models.dart';
import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';
import 'package:dart_mappable/dart_mappable.dart';

part "channel.model.mapper.dart";

@MappableClass()
class ChannelModel extends ChannelEntity with ChannelModelMappable implements IdHolder {
  ChannelModel({
    @MappableField(key: '_id') required super.id,
    required super.name,
    @MappableField(key: 'is_active') required super.isActive,
    @MappableField(key: 'is_deleted') required super.isDeleted,
    @DateTimeConverter() @MappableField(key: 'created_at') required super.createdAt,
    super.subscriptions,
    @MappableField(key: 'created_by') UserModel? super.createdBy,
    super.posts,
    super.storys,
  });

  factory ChannelModel.empty() => ChannelModel(
        id: 'empty',
        name: 'empty',
        isActive: true,
        isDeleted: false,
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: UserModel.empty(),
      );

  ChannelEntity toEntity() => ChannelEntity(
        id: id,
        name: name,
        isActive: isActive,
        isDeleted: isDeleted,
        createdAt: createdAt,
        createdBy: createdBy,
        subscriptions: subscriptions,
        posts: posts,
        storys: storys,
      );

  static ChannelModel fromEntity(ChannelEntity entity) => ChannelModel(
        id: entity.id,
        name: entity.name,
        isActive: entity.isActive,
        isDeleted: entity.isDeleted,
        createdAt: entity.createdAt,
        createdBy: switch (entity.createdBy) {
          final user? => UserModel.fromEntity(user),
          _ => null,
        },
        subscriptions: switch (entity.subscriptions) {
          final users? => users.map(UserModel.fromEntity).toList(),
          _ => null,
        },
        posts: switch (entity.posts) {
          final posts? => posts.map(PostModel.fromEntity).toList(),
          _ => null,
        },
        storys: switch (entity.storys) {
          final storys? => storys.map(StoryModel.fromEntity).toList(),
          _ => null,
        },
      );
}
