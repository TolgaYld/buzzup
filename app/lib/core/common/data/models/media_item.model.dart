import 'dart:io';

import 'package:buzzup/core/common/domain/entities/media_item.entity.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'media_item.model.mapper.dart';

@MappableClass()
class MediaItemModel extends MediaItemEntity with MediaItemModelMappable {
  MediaItemModel({
    required super.id,
    required super.uri,
    required super.position,
    super.file,
    super.isNew,
    super.isDeleted,
  });

  factory MediaItemModel.fromEntity(MediaItemEntity entity) {
    return MediaItemModel(
      id: entity.id,
      uri: entity.uri ?? '',
      position: entity.position,
      file: entity.file,
      isNew: entity.isNew,
      isDeleted: entity.isDeleted,
    );
  }

  MediaItemEntity toEntity() {
    return MediaItemEntity(
      id: id,
      uri: uri,
      position: position,
      file: file,
      isNew: isNew,
      isDeleted: isDeleted,
    );
  }
}
