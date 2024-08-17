import 'package:dart_mappable/dart_mappable.dart';

part 'location.mapper.dart';

@MappableClass()
class Location with LocationMappable {
  Location({required this.coordinates});

  factory Location.empty() => Location(coordinates: [3.69, 3.69]);

  final List<double> coordinates;
}
