import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'location.model.mapper.dart';

@MappableClass()
class LocationModel extends LocationEntity with LocationModelMappable {
  LocationModel({required super.coordinates});

  factory LocationModel.empty() => LocationModel(coordinates: [3.69, 3.69]);

  LocationEntity toEntity() => LocationEntity(coordinates: coordinates);

  static LocationModel fromEntity(LocationEntity entity) => LocationModel(coordinates: entity.coordinates);
}
