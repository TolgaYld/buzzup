import 'package:dart_mappable/dart_mappable.dart';

part 'location.entity.mapper.dart';

@MappableClass()
class LocationEntity with LocationEntityMappable {
  LocationEntity({required this.coordinates});

  factory LocationEntity.empty() => LocationEntity(coordinates: [3.69, 3.69]);

  final List<double> coordinates;
}
